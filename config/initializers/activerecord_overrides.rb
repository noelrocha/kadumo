#ActiveRecord overrides to add primary_key for belongs_to 

class ActiveRecord::Associations::AssociationProxy
  protected
    def set_belongs_to_association_for(record)
      owner_id = @owner.send(@reflection.options[:primary_key] || :id)
      if @reflection.options[:as]
        record["#{@reflection.options[:as]}_id"]   = owner_id unless @owner.new_record?
        record["#{@reflection.options[:as]}_type"] = @owner.class.base_class.name.to_s
      else
        record[@reflection.primary_key_name] = owner_id unless @owner.new_record?
      end
    end
end

module ActiveRecord
  module Associations
    def self.included(base)
      base.extend(ClassMethods)
    end
    module ClassMethods
      def belongs_to(association_id, options = {})
        reflection = create_belongs_to_reflection(association_id, options)
  
        ivar = "@#{reflection.name}"
  
        if reflection.options[:polymorphic]
          association_accessor_methods(reflection, BelongsToPolymorphicAssociation)
  
          method_name = "polymorphic_belongs_to_before_save_for_#{reflection.name}".to_sym
          define_method(method_name) do
            association = instance_variable_get(ivar) if instance_variable_defined?(ivar)
  
            if association && association.target
              if association.new_record?
                association.save(true)
              end
  
              if association.updated?
                self[reflection.primary_key_name] = association.send(reflection.options[:primary_key] || :id)
                #self[reflection.primary_key_name] = association.id
                self[reflection.options[:foreign_type]] = association.class.base_class.name.to_s
              end
            end
          end
          before_save method_name
        else
          association_accessor_methods(reflection, BelongsToAssociation)
          association_constructor_method(:build,  reflection, BelongsToAssociation)
          association_constructor_method(:create, reflection, BelongsToAssociation)
  
          method_name = "belongs_to_before_save_for_#{reflection.name}".to_sym
          define_method(method_name) do
            association = instance_variable_get(ivar) if instance_variable_defined?(ivar)
  
            if !association.nil?
              if association.new_record?
                association.save(true)
              end
  
              if association.updated?
                self[reflection.primary_key_name] = association.send(reflection.options[:primary_key] || :id)
                #self[reflection.primary_key_name] = association.id
              end
            end
          end
          before_save method_name
        end
  
        # Create the callbacks to update counter cache
        if options[:counter_cache]
          cache_column = options[:counter_cache] == true ?
            "#{self.to_s.demodulize.underscore.pluralize}_count" :
            options[:counter_cache]
  
          method_name = "belongs_to_counter_cache_after_create_for_#{reflection.name}".to_sym
          define_method(method_name) do
            association = send(reflection.name)
            association.class.increment_counter(cache_column, send(reflection.primary_key_name)) unless association.nil?
          end
          after_create method_name
  
          method_name = "belongs_to_counter_cache_before_destroy_for_#{reflection.name}".to_sym
          define_method(method_name) do
            association = send(reflection.name)
            association.class.decrement_counter(cache_column, send(reflection.primary_key_name)) unless association.nil?
          end
          before_destroy method_name
  
          module_eval(
            "#{reflection.class_name}.send(:attr_readonly,\"#{cache_column}\".intern) if defined?(#{reflection.class_name}) && #{reflection.class_name}.respond_to?(:attr_readonly)"
          )
        end
  
        add_single_associated_validation_callbacks(reflection.name) if options[:validate] == true
  
        configure_dependency_for_belongs_to(reflection)
      end
    
      private
        mattr_accessor :valid_keys_for_belongs_to_association
        @@valid_keys_for_belongs_to_association = [:class_name, :foreign_key, :primary_key, :foreign_type, 
          :remote, :select, :conditions, :include, :dependent, :counter_cache, :extend,
          :polymorphic, :readonly, :validate ]
    end 
  end
end

class ActiveRecord::Associations::BelongsToAssociation
  alias_method :replace_original, :replace  

  def replace(record)
    replace_original(record)

    if !record.nil?     
      record_id = record.send(@reflection.options[:primary_key] || :id)
      @owner[@reflection.primary_key_name] = record_id unless record.new_record?
      @updated = true
    end
  end

  private
    def find_target
      find_method = if @reflection.options[:primary_key]
                      "find_by_#{@reflection.options[:primary_key]}"
                    else
                      "find"
                    end
      @reflection.klass.send(find_method,
        @owner[@reflection.primary_key_name],
        :select     => @reflection.options[:select],
        :conditions => conditions,
        :include    => @reflection.options[:include],
        :readonly   => @reflection.options[:readonly]
      )
    end
end
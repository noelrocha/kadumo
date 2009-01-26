module ActiveRecord 
  module Associations 

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      
      alias_method :orig_belongs_to, :belongs_to
      def belongs_to(association_id, options = {})        
        orig_belongs_to(association_id, options)

        reflection = create_belongs_to_reflection(association_id, options)
        ivar = "@#{reflection.name}"
                                    
        method_name = "set_belongs_to_primary_key_for_#{reflection.name}"
        define_method(method_name) do
            association = instance_variable_get(ivar) if instance_variable_defined?(ivar)
        
            if !association.nil? && association.updated?
              if reflection.options[:polymorphic] 
                if !association.target.nil?
                  self[reflection.primary_key_name] = association.send(reflection.options[:primary_key] || :id)
                end
              else
                self[reflection.primary_key_name] = association.send(reflection.options[:primary_key] || :id)
              end
            end
        end
        before_save method_name
  
      end #def belongs_to

      private
        mattr_accessor :valid_keys_for_belongs_to_association
        @@valid_keys_for_belongs_to_association = [
          :class_name, :foreign_key, :primary_key, :foreign_type, 
          :remote, :select, :conditions, :include, :dependent, :counter_cache, :extend,
          :polymorphic, :readonly, :validate 
        ]

    end #module ClassMethods    
  end
end
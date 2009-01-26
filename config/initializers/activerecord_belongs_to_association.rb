#class ActiveRecord::Associations::BelongsToAssociation < ActiveRecord::Associations::AssociationProxy
module ActiveRecord
  module Associations
    class BelongsToAssociation < AssociationProxy #:nodoc:

      def replace(record)
        counter_cache_name = @reflection.counter_cache_column

        if record.nil?
          if counter_cache_name && !@owner.new_record?
            @reflection.klass.decrement_counter(counter_cache_name, @owner[@reflection.primary_key_name]) if @owner[@reflection.primary_key_name]
          end

          @target = @owner[@reflection.primary_key_name] = nil
        else                    
          raise_on_type_mismatch(record)
                    
          if counter_cache_name && !@owner.new_record?
            @reflection.klass.increment_counter(counter_cache_name, record.id)
            @reflection.klass.decrement_counter(counter_cache_name, @owner[@reflection.primary_key_name]) if @owner[@reflection.primary_key_name]
          end
  
          record_id = record.send(@reflection.options[:primary_key] || :id)
          @target = (AssociationProxy === record ? record.target : record)
          @owner[@reflection.primary_key_name] = record_id unless record.new_record?
          @updated = true
        end

        loaded
        record
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
  end
end #class BelongsToAssociation < AssociationProxy

module ActiveRecord
  module Associations
    class BelongsToAssociation < AssociationProxy #:nodoc:

      alias_method :orig_replace, :replace
      def replace(record)
        new_record = orig_replace(record)

        if !new_record.nil?
          raise_on_type_mismatch(new_record)

          record_id = new_record.send(@reflection.options[:primary_key] || :id)
          @target = (AssociationProxy === new_record ? new_record.target : new_record)
          @owner[@reflection.primary_key_name] = record_id unless new_record.new_record?
          @updated = true
        end
        
        loaded
        new_record
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

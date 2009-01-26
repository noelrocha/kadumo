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
end #class AssociationProxy

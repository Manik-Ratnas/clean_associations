
module CleanAssociations
 module Base
   def self.included(base)
     base.extend ClassMethods
   end  
  
   module ClassMethods 

    def get_invalid_records_for(association_name, options={}) 
   	    invalid_ids = get_invalid_ids(association_name,options)
   	     	if invalid_ids.count > 0
		     	p "There are #{invalid_ids.count} invalid records in your #{self.model_name} model." 
		     	p "Here are the ids:", invalid_ids
		        invalid_ids
		    else
		     	p 'No Invalid Records.!'
		     	[]
	   		end
 	end

 	def destroy_invalid_records_for(association_name, options={}) 
   	    invalid_ids = get_invalid_ids(association_name, options)
   	     	if invalid_ids.count > 0
		     	p "There are #{invalid_ids.count} in your #{self.model_name} model. Deleting the same" 
		     	self.destroy_all(:id=>invalid_ids)
		     else
		     	p 'No Invalid Records.!'
	   		end
 	end

 	 private

	  def get_invalid_ids(association_name, options={})
		invalid_records=[]
		assoc_name_sym= association_name.to_sym
		associations = self.reflect_on_all_associations(:belongs_to)
		main_assoc=self.reflections[assoc_name_sym]
		if main_assoc.present?
		    self.includes(assoc_name_sym).find_in_batches do |group|
		   	  group.each do |rec|
		        invalid_records << rec.id if rec.send(assoc_name_sym).nil?
		      end 
		    end
               
		else 
		 	raise "ArgumentError: Invalid Association name." 
		end
		     invalid_records
	  end

	  def get_attr_array(main_assoc)

	  	[self.table_name +  "." + self.primary_key,
         
	  	 main_assoc.association_foreign_key,

	  	  main_assoc.table_name + '.*']
	  end

   end
   class ActiveRecord::Base
  include CleanAssociations::Base
end

end
end





class ContentType < ActiveRecord::Base
  set_table_name "django_content_type"
  
  def self.app_label
    :contenttypes
  end
  
  def self.get_for_model(model)
    #Returns the ContentType object for a given model, creating the
    #ContentType if necessary. Lookups are cached so that subsequent lookups
    #for the same model don't hit the database.
    
    model_name = model.name.downcase
    app_label = model.app_label #.downcase
    find_or_create_by_app_label_and_model(:app_label=> app_label, :model => model_name, :name => model_name)
    
  end
  
end



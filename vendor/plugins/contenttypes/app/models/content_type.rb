class ContentType < ActiveRecord::Base
  set_table_name "django_content_type"

  def self.app_label
    :contenttypes
  end

  #Returns the ContentType object for a given model, creating the
  #ContentType if necessary. Lookups are cached so that subsequent lookups
  #for the same model don't hit the database.
  def self.get_for_model(model)

    if model.instance_of? String
      model = Kernel.const_get(model)  # It's a polymorphic_type
    elsif model.kind_of? Class
        # pass. It's a model
    else
        model = model.class  # It's an object
    end
    model_name = model.name.downcase
    app_label = model.app_label #.downcase
    find_or_create_by_app_label_and_model(:app_label=> app_label, :model => model_name, :name => model_name)

  end

end

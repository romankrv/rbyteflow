class TaggedItem < ActiveRecord::Base
  belongs_to :tag
  belongs_to :content_type
  app_label = 'tagging'
end

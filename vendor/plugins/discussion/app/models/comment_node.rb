class CommentNode < ActiveRecord::Base
  belongs_to :user
  belongs_to :content_type
  set_table_name "comment_nodes"
end

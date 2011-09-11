class CommentNode < ActiveRecord::Base
  belongs_to :commentable, :foreign_key => "object_id", :polymorphic => true
  belongs_to :user
  belongs_to :content_type
  set_table_name "comment_nodes"
end

class CommentNode < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true  # , :foreign_key => "object_id"
  belongs_to :user
  belongs_to :content_type
  set_table_name "comment_nodes"

  level = nil

  def self.tree_for_object(obj, where={})
    l = obj.comment_nodes.order('lft')
    if where
      l.where(where)
    end
    stack = []
    l.each do |i|
      
      stack_copy = stack.clone
      stack_copy.each do |j|
        if j < i.rght
          stack.pop()
        end
      end
      stack_size = stack.count
      i.level = stack_size
      stack.push(i.rght)
    end
    return l
  end

  attr_reader :level
  attr_writer :level
end

class CommentNode < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true  # , :foreign_key => "object_id"
  belongs_to :user
  belongs_to :content_type
  set_table_name "comment_nodes"

  level = nil

  after_create do |obj|
    if obj.reply_to_id
      comment_on = obj.class.find(obj.reply_to_id)
      target_rght = comment_on.rght - 1
      sql = <<-SQL
        UPDATE comment_nodes
        SET rght = rght + 2
        WHERE commentable_type = %s
              AND commentable_id = %s
              AND rght > %s
      SQL
      sql = sql % [obj.class.name, obj.id, target_rght]
      self.connection.execute(sql)
      obj.lft = target_rght + 1
      obj.rght = target_rght + 2
      obj.save()
    end
  end

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

class AddCommentableToCommentNodes < ActiveRecord::Migration
  def change
    add_column :comment_nodes, :commentable_id, :integer, {:null => true}
    add_column :comment_nodes, :commentable_type, :string, {:null => true}
    
    add_index :comment_nodes, [:commentable_id], :name => :comment_nodes_commentable_id
    add_index :comment_nodes, [:commentable_type], :name => :comment_nodes_commentable_type
  end
end

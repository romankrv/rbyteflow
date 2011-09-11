class PopulateCommentableToCommentNodes < ActiveRecord::Migration
  def up
    execute <<-SQL
      UPDATE
        comment_nodes
      SET
        commentable_id = object_id,
        commentable_type = 'Post'
      WHERE
        content_type_id = (
          SELECT
            id
          FROM
            django_content_type
          WHERE
            app_label = 'blog'
            AND model = 'post'
          LIMIT 1
        )
    SQL
  end

  def down
  end
end

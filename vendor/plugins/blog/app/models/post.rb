class Post < ActiveRecord::Base
  #self.per_page = 5

  def self.app_label
    :blog
  end

  set_table_name "blog_post"
  belongs_to :site
  belongs_to :author, :class_name => "User"
  has_many :comment_nodes, :as => :commentable, :dependent => :destroy


  def tease
    self.html.split('<!--more-->')[0]
  end

end

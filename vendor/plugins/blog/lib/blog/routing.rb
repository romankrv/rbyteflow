module Blog #:nodoc:
  module Routing #:nodoc:
    module MapperExtensions
      def blog
        @set.add_route("/blog", {:controller => "blog_controller", :action => "index"})
      end
    end
  end
end
 
ActionController::Routing::RouteSet::Mapper.send :include, Blog::Routing::MapperExtensions

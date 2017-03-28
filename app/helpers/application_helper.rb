module SpearWeb
  module Helpers
    module ApplicationHelper

      def relative_to_root(*paths)
        File.expand_path(File.join(root, *paths), __FILE__)
      end

      def title
        @title ? @title+' - Spear' : 'Spear'
      end

    end
  end
end
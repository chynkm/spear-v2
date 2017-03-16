module SpearWeb
  module Helpers
    module CommonHelper
      def relative_to_root(*paths)
        File.expand_path(File.join(root, *paths), __FILE__)
      end
    end
  end
end
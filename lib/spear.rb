class Spear
  def self.root
    File.expand_path('../..', __FILE__)
  end

  def self.relative_to_root(*paths)
    File.expand_path(File.join(root, *paths), __FILE__)
  end
end
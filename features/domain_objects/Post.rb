class Post
  attr_accessor :id, :title, :content

  def initialize(title, content)
    self.title = title
    self.content = content
  end
end

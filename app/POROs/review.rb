class Review
  attr_reader :author,
              :content,
              :id

  def initialize(data)
    @id = data[:id]
    @author = data[:author]
    @content = data[:content]
  end
end

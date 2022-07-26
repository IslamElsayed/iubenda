class Tag
  attr_reader :line, :dataset

  def initialize(line, dataset)
    @line = line
    @dataset = dataset
  end

  def tag
    line[line.index("[")..line.index("]")]
  end

  def tag_id
    @tag_id ||= tag.split("-")[-1][0..-2].to_i
  end

  def transform
    line.gsub(tag, data)
  end
end

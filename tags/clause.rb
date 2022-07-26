require_relative "tag"

class Clause < Tag
  def data
    dataset.find { |clause| clause[:id] == tag_id }[:text]
  end
end

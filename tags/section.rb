require_relative "tag"
require 'pry'

class Section < Tag
  attr_reader :sections, :clauses

  def initialize(line, clauses, sections)
    @line = line
    @clauses = clauses
    @sections = sections
  end

  def data
    clause_ids = sections.find { |section| section[:id] == tag_id }[:clauses_ids]
    clauses.filter_map { |clause| clause[:text] if clause_ids.include?(clause[:id]) }.join(";")
  end
end

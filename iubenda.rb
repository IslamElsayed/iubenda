Dir["./tags/*.rb"].each {|file| require_relative file }

class Iubenda
  attr_reader :template, :clauses, :sections

  def initialize(template, clauses, sections)
    @template = template
    @clauses = clauses
    @sections = sections
  end

  def execute
    transformed_tamplate = ""
    template.each_line do |line|
      transformed_tamplate << transform_line(line)
    end
    transformed_tamplate
  end

  private

  def transform_line(line)
    if line["CLAUSE"]
      Clause.new(line, clauses).transform
    elsif line["SECTION"]
      Section.new(line, clauses, sections).transform
    else
      line
    end
  end
end

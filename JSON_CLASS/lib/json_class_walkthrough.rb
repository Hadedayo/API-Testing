require "json"

class ParseJson
  attr_accessor :json_file

  def initialize(json_file)
    @json_file = JSON.parse(File.read(json_file))
  end

  def get_base
    #return the base
    json_file['base']
  end

  def get_date
    #return the date
    json_file['date']
  end

  def empty?(value)
    value.empty?
  end
end

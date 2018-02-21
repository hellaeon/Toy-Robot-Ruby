require_relative 'command'

class Report < Command

  def execute
    puts "#{@obj.x},#{@obj.y},#{@obj.orientation}"
  end
end

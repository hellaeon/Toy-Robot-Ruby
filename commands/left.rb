require_relative 'command'

class Left < Command

  def execute
    case obj.orientation
      when "NORTH"
        obj.orientation = "WEST"
      when "SOUTH"
        obj.orientation = "EAST"
      when "WEST"
        obj.orientation = "SOUTH"
      when "EAST"
        obj.orientation = "NORTH"
    end
  end

end

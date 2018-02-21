require_relative 'command'

class Right < Command

  def execute
    case obj.orientation
      when "NORTH"
        obj.orientation = "EAST"
      when "SOUTH"
        obj.orientation = "WEST"
      when "WEST"
        obj.orientation = "NORTH"
      when "EAST"
        obj.orientation = "SOUTH"
    end
  end

end

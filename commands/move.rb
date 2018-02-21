require_relative 'command'

class Move < Command
  def initialize(obj, table)
    @obj = obj
    @table = table
  end

  def execute
    case obj.orientation
      when "NORTH"
        obj.y += 1 if @table.is_valid_position?(obj.x, obj.y+1)
      when "SOUTH"
        obj.y -= 1 if @table.is_valid_position?(obj.x, obj.y-1)
      when "WEST"
        obj.x -= 1 if @table.is_valid_position?(obj.x-1, obj.y)
      when "EAST"
        obj.x += 1 if @table.is_valid_position?(obj.x+1, obj.y)
    end
  end

end
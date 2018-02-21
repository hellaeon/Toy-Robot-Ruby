require_relative 'command'

class Place < Command
  def initialize(obj, table, cmd)
    @obj = obj
    @table = table
    @cmd = cmd
  end

  def execute
    cmds = @cmd.split(" ").last.split(",")
    if @table.is_valid_position?(cmds[0].to_i, cmds[1].to_i)
      obj.x = cmds[0].to_i
      obj.y = cmds[1].to_i
      obj.orientation = cmds[2]
    else
      puts "INVALID POSITION: #{@cmd}"
    end

  end
end


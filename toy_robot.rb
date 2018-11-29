# pattern works nicely and lexically makes sense - I am sending commands to my toy robot!

require './table'
require './command_history'
require './commands/place'
require './commands/move'
require './commands/left'
require './commands/right'
require './commands/report'
require './robot'

class RobotCaller
  
  def initialize (table_x, table_y)
    @toy_robot = Robot.new
    @table = Table.new(table_x, table_y)
    @cmd_history = CommandHistory.new # records the history
  end

  def command_for(cmd)
    case cmd
      when /PLACE/ then @cmd_history.execute(Place.new(@toy_robot, @table, cmd))
      when /LEFT/ then @cmd_history.execute(Left.new(@toy_robot))
      when /RIGHT/  then @cmd_history.execute(Right.new(@toy_robot))
      when /MOVE/ then @cmd_history.execute(Move.new(@toy_robot, @table))
      when /REPORT/  then @cmd_history.execute(Report.new(@toy_robot))
      else puts 'Unsure what yopu want me to do?'
    end
  end

end

robot_caller = RobotCaller.new(5,5)

File.readlines("commands.txt").each do |line|
  robot_caller.command_for(line)
end

# better name?
class BaseRobotCommand

  # Implements the chain of responsibility pattern. Does not know anything
  # about the commands themselves, merely whether the current handler
  # can tell it what to do or whether it must pass it to a successor.

  attr_reader :successor
  attr_writer :x, :y

  def initialize successor
    @successor = successor
  end

  def process_request request
    raise "not implemented error"
  end

  def deny_request request
    puts "Your request for $#{request.amount} needs a board meeting!"
  end

  def out_of_bounds request
    @x += request.x
    @y += request.y
    return true if @x < 0 || @x > 4
    return true if @y < 0 || @y > 4
    false
  end
end

class RobotCommand
  attr_reader :command, :x, :y

  def initialize(command, x, y)
    @command = command
    @x = x
    @y = y
  end
end

class Place < BaseRobotCommand
  def process_request request
    # if request.amount <= 1000
    #   puts "Manager will approve $#{request.amount}"
    # else @successor.process_request request
    # end
  end
end

class Move < BaseRobotCommand
  def process_request request
    # if request.amount <= 1000
    #   puts "Manager will approve $#{request.amount}"
    # else @successor.process_request request
    # end
  end
end

class Left < BaseRobotCommand
  def process_request request
    # if request.amount <= 1000
    #   puts "Manager will approve $#{request.amount}"
    # else @successor.process_request request
    # end
  end
end

class Right < BaseRobotCommand
  def process_request request
    # if request.amount <= 1000
    #   puts "Manager will approve $#{request.amount}"
    # else @successor.process_request request
    # end
  end
end

class Report < BaseRobotCommand
  def process_request request
    # if request.amount <= 1000
    #   puts "Manager will approve $#{request.amount}"
    # else @successor.process_request request
    # end
  end
end

class ToyRobot
  def initialize(*commands)
    commands = build_approvers(commands)
    @authority = commands.first
  end

  def process_request request
    @authority.process_request request
  end

  private

  def build_commands(command_classes)
    [].tap do |commands|
      command_classes.reverse.inject(nil) do |successor, command_class|
        command_class.new(successor).tap do |command_class|
          commands.unshift command_class
        end
      end
    end
  end
end

# main program
# ------------

approvers = CLP.new(Manager, Director, VicePresident, President, CFO)

srand Time.now.to_i
(1..10).each do |step|
  $stdout.flush
  amount = rand(150000)
  puts
  puts "Getting Approval for $#{amount}"
  print ">> "
  sleep 1
  approvers.process_request PurchaseRequest.new(0, amount, 'General')
end
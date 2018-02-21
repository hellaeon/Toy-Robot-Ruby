class CommandHistory
  attr_reader :history

  def execute(cmd)
    @history ||= []
    @history << cmd.execute
  end
end

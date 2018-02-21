class Command
  attr_reader :obj

  def initialize(obj)
    @obj = obj
  end

  def execute
    raise NotImplementedError
  end
end

#before inheritance
class Cat

  attr_reader :name
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = 'nervous'
  end

end

# after inheritance
class Cat < Animal

  attr_reader :num_lives

  def initialize(name)
    super
    @num_lives = 9
  end

end

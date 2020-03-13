# before inheritance
class Fish

  attr_reader :name
  attr_accessor :mood

  def initialize(name)
    @name = name
    @mood = 'nervous'
  end

end

# after inheritance

class Fish < Animal

end

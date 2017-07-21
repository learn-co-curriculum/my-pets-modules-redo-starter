class Cat < Pet
  attr_reader :num_lives

  def initialize(name)
    @num_lives = 9
    super(name)
  end
end

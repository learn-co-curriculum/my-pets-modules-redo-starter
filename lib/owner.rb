# before inheritance
class Owner

  ALL = []

  def self.all
    ALL
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.length
  end

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(name)
    @name = name
    @species = 'human'
    @pets = {:fishes => [], :dogs => [], :cats => []}
    ALL << self
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
   pets[:fishes] << Fish.new(name)
 end

 def buy_dog(name)
   pets[:dogs] << Dog.new(name)
 end

 def buy_cat(name)
   pets[:cats] << Cat.new(name)
 end

 def walk_dogs
   pets[:dogs].each do |dog|
     dog.mood = "happy"
   end
 end

 def play_with_cats
   pets[:cats].each do |cat|
     cat.mood = "happy"
   end
 end

 def feed_fish
   pets[:fishes].each do |fish|
     fish.mood = "happy"
   end
 end

 def sell_pets
   pets.each do |species, animals|
     animals.each do |animal|
       animal.mood = "nervous"
     end
     animals.clear
   end
 end

 def list_pets
   "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
 end

end

# after inheritance
require 'pry'
class Owner

  attr_reader :species
  attr_accessor :name, :pets


  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  ALL = []

  def initialize(species)
    # self.class.all << self
    super
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    self.pets[:fishes] << fish
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    self.pets[:cats] << cat
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.map do |type, pets_array|
      pets_array.map do |pet|
        pet.mood = "nervous"
      end
      pets_array.clear
    end
  end

  def list_pets
    n_cats = self.pets[:cats].length
    n_dogs = self.pets[:dogs].length
    n_fish = self.pets[:fishes].length

    "I have #{n_fish} fish, #{n_dogs} dog(s), and #{n_cats} cat(s)."
  end
end 

module Persistable


  module ClassMethods
    def all
      self::ALL
    end

    def reset_all
      self.all.clear
    end

    def count
      self.all.length
    end
  end

  module InstanceMethods

    def initialize(*args)
      self.class.all << self
    end

  end

  # def initialize
  #   self.class.all << self
  # end

end

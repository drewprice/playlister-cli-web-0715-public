module Memorable
  module ClassMethods
    @@all = []

    def all
      @@all
    end

    def reset_all
      @@all.clear
    end

    def count
      @@all.count
    end

    def create_by_name(name)
      new.tap { |i| i.name = name }
    end
  end

  module InstanceMethods
    def initialize
      self.class.all << self
    end
  end
end

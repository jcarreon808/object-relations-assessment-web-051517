class Restaurant
  attr_accessor :name, :reviews

  @@all =[]
  def initialize(name)
    @name = name
    @reviews =[]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect do |restaurant|
      restaurant.name == name
    end
  end

  def reviews
    @reviews
  end

  def customers
    @reviews.collect do |restaurant|
      restaurant.customer
    end
  end



end

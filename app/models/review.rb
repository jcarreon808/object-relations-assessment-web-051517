class Review
  attr_accessor :customer, :restaurant, :content
  @@all = []

  def initialize(restaurant, content)
    @restaurant = restaurant
    @content = content
    @@all << self
    restaurant.reviews << self
  end

  def self.all
    @@all
  end

  def customer
    self.all.detect do |review|
      review.customer
    end
  end

  def restaurant
    self.all.detect do |review|
      review.restaurant
    end
  end

end

# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name, :reviews

  @@all =[]
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @reviews =[]
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(fullname)
    self.all.detect do |customer|
      customer.first_name == fullname.split(' ')[0] && customer.last_name ==fullname.split(' ')[1]
    end
  end

  def self.find_all_by_first_name(name)
    self.all.select do |customer|
      customer.first_name.include?(name)
    end
  end

  def self.all_names
    self.all.collect do |customer|
      "#{customer.first_name} #{customer.last_name}"
    end
  end

  def add_review(restaurant, content)
    new_review = Review.new(restaurant, content)
    new_review.customer = self
    @reviews << new_review
    new_review
  end
end

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

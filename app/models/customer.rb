require "pry"
require_relative 'restaurant.rb'
require_relative 'review.rb'
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
binding.pry

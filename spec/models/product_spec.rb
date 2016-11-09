require 'rails_helper'

describe Product do
  before do
      @product = Product.create!(name:"Hannibal: Rome vs Carthage")
      @user = User.create!(first_name:"Benjie",email:"test@test.com",password:"test123")
      @product.comments.create!(rating: 5, user: @user, body: "Great game!")
      @product.comments.create!(rating: 1, user: @user, body: "Awful game!")
      @product.comments.create!(rating: 3, user: @user, body: "Meh.")
  end

  it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
  end

  it "is not valid" do
      expect(Product.new(description: "Nice game")).not_to be_valid
  end

end

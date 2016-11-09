require "rails_helper"

describe CommentsController, :type => :controller do
  before do
    @product = FactoryGirl.create(:product)
    @comment = FactoryGirl.build(:comment).attributes
  end

  context "with valid params" do

    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    it "creates a new comment" do
      expect{
        post :create, params: { product_id: @product.id, comment: @comment }
      }.to change(Comment, :count).by(1)
    end

  end
end
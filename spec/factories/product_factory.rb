FactoryGirl.define do
	sequence(:name) { |n| "name #{n}" }

	factory :product do
		name
		description "This is a boardgame"
		image_url "images/image.jpg"
		price 50

		factory :invalid_product do
			name nil
		end
	end
end
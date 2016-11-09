FactoryGirl.define do

  factory :comment do
    rating { rand(1..5) }
    user
    body "This is my review!"

    factory :invalid_comment do
        body nil
    end
    
  end
  
end
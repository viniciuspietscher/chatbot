FactoryBot.define do

  factory :faq do
    question Faker::SiliconValley.invention
    answer Faker::SiliconValley.quote
    company
  end

end

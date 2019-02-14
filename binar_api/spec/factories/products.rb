FactoryBot.define do
  factory :product do
    name { Fake::Name.name }
    price 50_000_000
    imageurl 'https://sopyan.id/test.png'
  end
end

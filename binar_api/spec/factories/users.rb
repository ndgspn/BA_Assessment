FactoryBot.define do
 factory :user do
   name { Fake::Name.name }
   email 'tes@api.com'
   password 'password'
 end 
end

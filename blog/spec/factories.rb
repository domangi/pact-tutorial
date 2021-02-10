# This will guess the User class
FactoryBot.define do
  factory :article do
    title { 'A title' }
    user_id { 1 }
  end
end

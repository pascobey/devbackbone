FactoryBot.define do
  factory :user_story do
    story { "MyString" }
    value { 1 }
    editor_user_id { 1 }
    approved { false }
    color { 1 }
  end
end

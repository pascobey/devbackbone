FactoryBot.define do
  factory :entry do
    change_log_id { 1 }
    committer { 1 }
    message { "MyString" }
  end
end

FactoryBot.define do
  factory :user do
    name {"Luciano"}
    email {"user@user.com"}
    password {"password"}
    phone {"90909090"}
    avatar {Rack::Test::UploadedFile.new(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")}
  end
end
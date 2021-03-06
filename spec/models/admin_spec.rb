require 'rails_helper'

#                   TESTES DE VALIDAÇÃO

RSpec.describe Admin, type: :model do
  it "admin is valid" do
    admin = Admin.new(email: "admin@admin.com", password: "123123", name: "Admin First")

    expect(admin.email).to eql "admin@admin.com"
    expect(admin).to be_valid
  end

  it "admin is not valid" do
    admin = Admin.new(email: "admin@admin.com")

    expect(admin).to_not be_valid
  
  end
end

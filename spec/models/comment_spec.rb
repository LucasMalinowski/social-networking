require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "user comments a post" do

    fiuk = FactoryBot.create(:user)
    rick = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: fiuk)

    comment = FactoryBot.create(:comment, user:rick, post: post)
   
    expect(post.comments.count).to eql 1
    expect(post.comments.first.user).to eql rick

    expect(rick.comments.first).to eql comment

  end
end

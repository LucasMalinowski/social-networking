require 'rails_helper'

RSpec.describe Like, type: :model do
  it "user likes a post" do
    
    fiuk = FactoryBot.create(:user)
    rick = FactoryBot.create(:user)
    anjo = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: fiuk)

    Like.create(user: rick, post: post)
    Like.create(user: anjo, post: post)

    expect(post.likes.count).to eql 2
    expect(post.likes.first.user).to eql rick
    expect(post.likes.last.user).to eql anjo

    Like.find_by(post: post, user: rick).destroy

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql anjo
  end
end
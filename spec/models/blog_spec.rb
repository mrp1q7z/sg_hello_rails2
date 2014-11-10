require 'rails_helper'

RSpec.describe Blog, :type => :model do
  it "titleがあれば有効な状態であること" do
    @blog = Blog.new
    @blog.title = 'test'
    expect(@blog).to be_valid
  end

  it "titleがなければ無効な状態であること" do
    @blog = Blog.new
    expect(@blog).not_to be_valid
  end
end

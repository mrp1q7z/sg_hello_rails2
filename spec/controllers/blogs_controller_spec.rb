require 'rails_helper'

RSpec.describe BlogsController, :type => :controller do
  describe "GET #index" do
    it "@blogsに全てのBlogが入っていること" do
      get :index
      @blogs = Blog.all
      expect(assigns(:blogs)).to eq @blogs
    end
  end

  describe "POST #create" do
    before do
      post :create, { blog: {title: 'test'} }
    end
    it "新規作成後に@blogのshowに遷移すること" do
      @blog = Blog.last
      # Deprecation Warnings が出るので...
      #response.should redirect_to blog_path(@blog)
      expect(response).to redirect_to blog_path(@blog)
    end
  end
end

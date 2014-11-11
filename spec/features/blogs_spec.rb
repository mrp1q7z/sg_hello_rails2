require 'rails_helper'

feature "Blogs", :type => :feature do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit new_blog_path
    click_button 'Save'
    expect(page).to have_text "Title can't be blank"
  end

  scenario 'Blogの新規作成時にtitleを入力した場合にデータが保存され閲覧画面に遷移するこ' do
    visit new_blog_path
    fill_in 'Title', with: 'title'
    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)
    expect(current_path).to eq blog_path(Blog.last)
  end
end

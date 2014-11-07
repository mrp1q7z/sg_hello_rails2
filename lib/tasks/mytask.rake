namespace :mytask do
  desc "mytask"

  task :create_test_data => :environment do
    # ブログの作成
    blog1 = Blog.new(title: 'ねこがすき！にゃんにゃんブログ')
    blog1.save
    blog2 = Blog.new(title: 'いぬがすき！わんわんブログ')
    blog2.save
    blog3 = Blog.new(title: 'つまがすき！いとうさんブログ')
    blog3.save

    # エントリーの作成
    entry1 = blog1.entries.build
    entry1.title = 'はじめてのエントリー'
    entry1.body = 'はじめまして！'
    entry1.save

    entry2 = blog1.entries.build(title: '２番目のエントリー', body: 'おひさしぶりです！')
    entry2.save

    entry3 = blog3.entries.build(title: '３番目のエントリー', body: 'もうくじけました・・・')
    entry3.save

    # コメントの作成
    comment1 = entry1.comments.build(body: 'てすてす', status: 'approved')
    comment1.save
    comment2 = entry1.comments.build(body: 'ねこはかわいいですよね', status: 'unapproved')
    comment2.save
    comment3 = entry2.comments.build(body: '例のいぬについて', status: 'approved')
    comment3.save
    comment4 = entry3.comments.build(body: 'こんにちはこんにちは！', status: 'approved')
    comment4.save
  end

  # Blogのid:1に紐づくすべてのCommentを取得
  task :blog1_comments => environment do
    Comment.joins(:entry).where("entries.blog_id = 1")
  end

  # まだEntryを書いていないBlog
  task :empty_blog => environment do
    Blog.where.not id: Entry.select(:blog_id)
  end

  # statusがunapprovedであるCommentがあるEntryのあるBlogを表示
  task :status_eq_unapproved => environment do
    Blog.joins(entries: :comments).where("comments.status = 'unapproved'")
  end
end

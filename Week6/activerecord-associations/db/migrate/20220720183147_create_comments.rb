class CreateComments < ActiveRecord::Migration[6.1]
  def change
      create_table :comments do |t|
      t.integer :article_id, null: false
      t.text :body, null: false 

      t.timestamps null: false
      end
  end
end


cat_article = Article.create(subject: "Some thoughts about cats", story: "They're OK.")
ruby_article = Article.create(subject: 'Ruby vs. Python', story: 'Ruby wins cause I said so.')

Comment.create(body: 'LOL', article_id: cat_article.id)
Comment.create(body: 'click here for a free iPad!', article_id: cat_article.id)

Comment.create(body: 'great analysis!!!', article_id: ruby_article.id)
Comment.create(body: 'ruby is so 2010, Go is the future', article_id: ruby_article.id)
Comment.create(body: 'i like ice cream', article_id: ruby_article.id)
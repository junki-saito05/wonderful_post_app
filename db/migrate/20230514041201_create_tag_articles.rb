class CreateTagArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_articles do |t|
      t.references :tag, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end

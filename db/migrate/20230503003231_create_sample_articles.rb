class CreateSampleArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :sample_articles do |t|
      t.string :title
      t.text :content
      t.string :rails
      t.migrate :db

      t.timestamps
    end
  end
end

class CreateShortenedUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :shortened_urls do |t|
    end
    add_column :shortened_urls, :long_url, :string
    add_column :shortened_urls, :short_url, :string
    add_column :shortened_urls, :user_id, :integer

    add_index :shortened_urls, :short_url, unique: true
    add_foreign_key :shortened_urls, :users
  end
end

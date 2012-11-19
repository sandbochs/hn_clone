class CreatePostsTable < ActiveRecord::Migration

	def change
		
		create_table :posts do |t|
			t.string :title
			t.string :article_url
			t.integer :user_id
			t.integer :vote_count, default: 0

			t.timestamps
		end

		add_index :posts, :user_id
		add_index :posts, :vote_count
	end

end

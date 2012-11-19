class Post < ActiveRecord::Base
	attr_accessible :title, :article_url, :user_id

	validates :article_url, uniqueness: true

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :votes, dependent: :destroy

end
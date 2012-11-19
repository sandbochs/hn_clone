# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'elliot')
User.create(username: 'amy')
Post.create(title: 'Google', article_url: 'http://google.com', user_id: 1)
Post.create(title: 'Yahoo', article_url: 'http://yahoo.com', user_id: 1)
Post.create(title: 'Hacker News', article_url: 'http://news.ycombinator.com', user_id: 2)
Post.create(title: 'Reddit', article_url: 'http://reddit.com', user_id: 2)

50.times do
	Post.create(title: Faker::Lorem.sentence(word_count = 3, supplemental = false), article_url: Faker::Internet.url, user_id: 1)
	Post.create(title: Faker::Lorem.sentence(word_count = 3, supplemental = false), article_url: Faker::Internet.url, user_id: 2)
end
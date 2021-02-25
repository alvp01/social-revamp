require_relative '../lib/populator_fix.rb'

password = '123456'

User.populate 15 do |u|
  u.fullname = Faker::Name.name_with_middle
  u.username = Faker::Internet.unique.username(specifier: u.username, separators: %w(_ -))
  u.email = Faker::Internet.unique.email
  u.photo = ""
  u.coverimage = ""
  u.encrypted_password = User.new(:password => password).encrypted_password
end

users = User.all

users.each do |u|
  3.times do |p|
    u.posts.create({text: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4)})
  end
end

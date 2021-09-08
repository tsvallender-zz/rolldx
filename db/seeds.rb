user = User.new
user.email = "user@summonplayer.com"
user.password = "foobar"
user.password_confirmation = "foobar"
user.username = "user"
user.skip_confirmation!
user.save!

10.times do |n|
  user = User.new
  user.email = "example#{n+1}@summonplayer.com"
  user.password = "password"
  user.password_confirmation = "password"
  user.username = Faker::Name.unique.name.gsub!(/[^\w_]/i, '').first(20)
  user.skip_confirmation!
  user.save!
end

User.all.each do |u|
  4.times do
    table = u.tables.build(title: Faker::Lorem.sentence(word_count: 3).first(30))
    rand(4..20).times do |r|
      table.rows.build(name: Faker::Lorem.sentence(word_count: 2),
                       description: Faker::Lorem.sentence(word_count: 5))
    end
    table.save!
  end
end

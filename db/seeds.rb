user = User.new
user.email = "user@summonplayer.com"
user.password = "foobar"
user.password_confirmation = "foobar"
user.username = "user"
user.skip_confirmation!
user.save!

d = Die.new(name: 'd4', numbers: (1..4).to_a)
d.save!
d = Die.new(name: 'd6', numbers: (1..6).to_a)
d.save!
d = Die.new(name: 'd8', numbers: (1..8).to_a)
d.save!
d = Die.new(name: 'd10', numbers: (1..10).to_a)
d.save!
d = Die.new(name: 'd12', numbers: (1..12).to_a)
d.save!
d = Die.new(name: 'd20', numbers: (1..20).to_a)
d.save!
d = Die.new(name: 'd66', numbers: (11..16).to_a+(21..26).to_a+(31..36).to_a+(41..46).to_a+(51..56).to_a+(61..66).to_a)
d.save!
d = Die.new(name: 'd100', numbers: (1..100).to_a)
d.save!

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
    rownum = 1
    rand(4..20).times do |r|
      table.rows.build(num: rownum, name: Faker::Lorem.sentence(word_count: 2),
                       description: Faker::Lorem.sentence(word_count: 5))
      rownum += 1
    end
    table.save!
    table.create_activity :create, owner: u
  end

  2.times do
    tables = []
    5.times do
      tables << 1 + rand(Table.count)
    end
    
    list = u.lists.build(name: Faker::Lorem.sentence(word_count: 3),
                         description: Faker::Lorem.sentence(word_count: 20),
                         private: false, table_ids: tables)
    if list.save!
      list.create_activity :create, owner: u
    end
  end
end

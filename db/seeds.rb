user = User.new
user.email = "user@summonplayer.com"
user.password = "foobar"
user.password_confirmation = "foobar"
user.username = "user"
user.skip_confirmation!
user.save!

d4 = Die.new(name: 'd4', numbers: (1..4).to_a)
d4.save!
d6 = Die.new(name: 'd6', numbers: (1..6).to_a)
d6.save!
d8 = Die.new(name: 'd8', numbers: (1..8).to_a)
d8.save!
d10 = Die.new(name: 'd10', numbers: (1..10).to_a)
d10.save!
d12 = Die.new(name: 'd12', numbers: (1..12).to_a)
d12.save!
d20 = Die.new(name: 'd20', numbers: (1..20).to_a)
d20.save!
d66 = Die.new(name: 'd66', numbers: (11..16).to_a+(21..26).to_a+(31..36).to_a+(41..46).to_a+(51..56).to_a+(61..66).to_a)
d66.save!
d100 = Die.new(name: 'd100', numbers: (1..100).to_a)
d100.save!

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
    die = Die.all.to_a.sample
    table = u.tables.build(title: Faker::Lorem.sentence(word_count: 3).first(30),
                           die_id: die.id)
    rownum = 1
    die.numbers.length.times do |r|
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

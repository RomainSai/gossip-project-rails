require 'faker'

10.times do
  city = City.create(name: Faker::Address.city, postal_code: Faker::Number.number(5))
end

10.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.email, age: Faker::Number.between(14, 69), city_id: rand((City.first.id)..(City.last.id)))
end

20.times do
  gossip = Gossip.create(title: Faker::Community.characters, content: Faker::Community.quotes, user_id: rand((User.first.id)..(User.last.id)))
end

10.times do
  tag = Tag.create(title: Faker::Community.characters)
end

for i in ((Tag.first.id)..(Tag.last.id))
  gossip = Gossip.find(i)
  tag = Tag.find(i)
  gossip.tags << tag
end

10.times do
  gossip_id = rand((Gossip.first.id)..(Gossip.last.id))
  tag_id = rand((Tag.first.id)..(Tag.last.id))
  gossip = Gossip.find(gossip_id)
  tag = Tag.find(tag_id)
  gossip.tags << tag
end

1.times do
  private_message = PrivateMessage.create(content: Faker::Community.quotes, recipient_id:  rand((User.first.id)..(User.last.id)), sender_id: rand((User.first.id)..(User.last.id)))
end

20.times do
  comment = Comment.create(content: Faker::Community.quotes, gossip_id: rand((Gossip.first.id)..(Gossip.last.id)), user_id: rand((User.first.id)..(User.last.id)))
end

20.times do
  randomizer = rand(1..2)
  if randomizer.modulo(2) == 0
    like =  Like.create(
      likeable_type: "Comment",
      likeable_id: rand((Comment.first.id)..(Comment.last.id))
    )
  else
    like =  Like.create(
      likeable_type: "Gossip",
      likeable_id: rand((Gossip.first.id)..(Gossip.last.id))
    )
  end
end

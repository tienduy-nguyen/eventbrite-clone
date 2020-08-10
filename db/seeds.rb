
User.destroy_all
Event.destroy_all
Category.destroy_all
EventTag.destroy_all
Attendance.destroy_all


Category.create(title: "Arts")
Category.create(title: "Business")
Category.create(title: "Charity")
Category.create(title: "Education")
Category.create(title: "Fashion")
Category.create(title: "Film & Media")
Category.create(title: "Food & Drink")
Category.create(title: "Health")
Category.create(title: "Hobbies")
Category.create(title: "Holiday")
Category.create(title: "Music")
Category.create(title: "Science & Tech")
Category.create(title: "Spirituality")
Category.create(title: "Sports & Fitness")
Category.create(title: "Travel & Outdoor")
Category.create(title: "Other")

puts "Create categories"

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    sex: ['Mr','Mrs', 'Ms'].sample,
    job: Faker::Job.title,
    company: Faker::Company.name,
    avatar: Faker::Avatar.image,
    description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
  )
end
puts "Create users"

50.times do
  Event.create(
    organizer: User.all.sample,
    title: Faker::Quote.matz[0..120],
    start_date: Faker::Date.forward(days: rand(2..50)),
    duration: rand(120..480),
    price: rand(0..500),
    location: Faker::Address.full_address,
    category: Category.all.sample,
    description: Faker::Lorem.sentence(word_count: rand(20..100)) #=> "Quaerat quam unde."
  )
end
puts "Create Events"


50.times do
  Attendance.create(
    attendee: User.all.sample,
    event: Event.all.sample,
    stripe_customer_id: Faker::IDNumber.brazilian_citizen_number
  )
end
puts "Create Attendances"


Create Tag
30.times do
  title = Faker::Dessert.variety.strip.downcase
  title.gsub!(/\s+/, '-')
  Tag.create(
    title: title,
  )
end
puts "Tags created!"

100.times do
  EventTag.create(
    tag: Tag.all.sample,
    event: Event.all.sample,
  )
end
puts "EventTags created!"
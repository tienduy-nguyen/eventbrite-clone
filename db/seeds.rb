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

Type.create(title: "Appearance or Singing")
Type.create(title: "Attraction")
Type.create(title: "Camp, Trip or Retreat")
Type.create(title: "Class, Training or Workshop")
Type.create(title: "Concert & Performance")
Type.create(title: "Festival or Fair")
Type.create(title: "Convention")
Type.create(title: "Diner or Gala")
Type.create(title: "Game or Competition")
Type.create(title: "Meeting or Network Event")
Type.create(title: "Party or Social Gathering")
Type.create(title: "Race or Endurance Event")
Type.create(title: "Rally")
Type.create(title: "Screening")
Type.create(title: "Seminar or Talk")
Type.create(title: "Tour")
Type.create(title: "Tournament")
Type.create(title: "Webinar")
Type.create(title: "Online Conference")
Type.create(title: "Other")

puts "Create types"

User.create(
  first_name: "Admin",
  last_name: "1",
  email: "admin@admin.com",
  password: "admin1234567",
  password_confirmation: "admin1234567",
  is_admin: true
)


100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    sex: ['Mr.','Mrs.', 'Ms'].sample,
    job: Faker::Job.title,
    password: "1234567",
    password_confirmation: "1234567",
    company: Faker::Company.name,
    avatar: Faker::Avatar.image,
    description: Faker::Lorem.sentence(word_count: 10, supplemental: true, random_words_to_add: 10),
  )
end
puts "Create users"

User.all.each do |user|
  Organizer.create(name: user.name, user: user)
end
puts "Create Organizer"

100.times do
  Event.create(
    organizer: Organizer.all.sample,
    title: Faker::Quote.matz[0..120],
    start_date: Faker::Date.forward(days: rand(50..100)),
    start_at: Time.now,
    end_at: Time.now + 1*60*60,
    price: rand(0..500),
    type: Type.all.sample,
    type_location: "Online Event",
    location: Faker::Address.full_address,
    category: Category.all.sample,
    description: Faker::Lorem.sentence(word_count: rand(20..100)),
    is_publish: true,
    validated: true
  )
end
puts "Create Events"

# Update event
# Event.all.each do |event|
#   event.update(
#     organizer: Organizer.all.sample,
#     title: Faker::Quote.matz[0..120],
#     start_date: Faker::Date.forward(days: rand(2..50)),
#     start_at: Time.now,
#     end_at: Time.now + 1*60*60,
#     price: rand(0..500),
#     type: Type.all.sample,
#     type_location: "Online Event",
#     location: Faker::Address.full_address,
#     category: Category.all.sample,
#     description: Faker::Lorem.sentence(word_count: rand(20..100)),
#     is_publish: true,
#     validated: true
#   )
# end


50.times do
  Attendance.create(
    attendee: User.all.sample,
    event: Event.all.sample,
    stripe_customer_id: Faker::IDNumber.brazilian_citizen_number
  )
end
puts "Create Attendances"


# # # Create Tag
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

# Create Organizer by default
User.all.each do |user|
  Organizer.create(name: user.full_name, user: user)

end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{first_name: 'Nadine', last_name: 'Javier',  age: 20, email: 'nad4ne@gmail.com', password: 'enidan23', location: 'San Francisco', bio: 'I like hedgehogs, and volunteering!'}, {first_name: 'Nick', last_name:'Scalf', age:23,email: 'nick@yahoo.com', password: 'nick', location: 'San Francisco', bio: 'I love coffee, and Im awesome'}, {first_name: 'Boris', last_name: 'Danilin', age: 25, email: 'boris@gmail.com', password: 'boris',location: 'Fremont', bio: 'I am a vampire.'} ])

events = Event.create([{title: 'Ocean Beach Clean Up', date:'July 15,2017', start_time: '11:00am', end_time: '6:00pm', address: 'Ocean Beach, SF', description: 'Hang out with friends while making new ones and keeping our beautiful beach clean!', complete: false}, {title: 'Yoga for Breast Cancer', date:'July 1, 2015', start_time: '6:00pm', end_time: '7:30pm', address: 'Mission Yoga', description: 'Come to class and help out a good cause.', complete: false }])

categories = Category.create([{title: 'Animals'}, {title: 'Environment'}, {title: 'Education'}, {title: 'Arts and Culture'}, {title: 'Community'}, {title: 'Fundraising'}])


5.times do 
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(18,40),
    location: 'San Francisco',
    bio: Faker::Hipster.paragraph(2, false, 4),
    email: Faker::Internet.free_email('user'),
    password: 'test'
    )

10.times do
  Event.create(
    title: Faker::Company.catch_phrase,
    start_time: Faker::Time.between(DateTime.now - 1, DateTime.now),
    end_time: Faker::Time.between(DateTime.now - 1, DateTime.now),
    address: Faker::Address.street_address,
    description: Faker::Matz.quote,
    complete: false)
end
end
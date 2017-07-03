# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{first_name: 'Nadine', last_name: 'Javier',  age: 20, email: 'nad4ne@gmail.com', password: 'enidan23', location: 'San Francisco', bio: 'I like hedgehogs, and volunteering!'}, {first_name: 'Nick', last_name:'Scalf', age:23,email: 'nick@yahoo.com', password: 'nick', location: 'San Francisco', bio: 'I love coffee, and Im awesome'}, {first_name: 'Boris', last_name: 'Danilin', age: 25, email: 'boris@gmail.com', password: 'boris',location: 'Fremont', bio: 'I am a vampire.'} ])

events = Event.create([{title: 'Ocean Beach Clean Up', date:Time.now , start_time: Time.now , end_time: Time.now , address: 'Ocean Beach, SF', description: 'Hang out with friends while making new ones and keeping our beautiful beach clean!', complete: false}, {title: 'Yoga for Breast Cancer', date: Time.now , start_time: Time.now , end_time: Time.now , address: 'Mission Yoga', description: 'Come to class and help out a good cause.', complete: false }])

categories = Category.create([{title: 'Animals'}, {title: 'Environment'}, {title: 'Education'}, {title: 'Arts and Culture'}, {title: 'Community'}, {title: 'Fundraising'}])




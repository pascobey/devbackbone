# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dhh = User.create(
    email: 'david@hey.com',
    password: 'imadethisforyou',
    confirmed_at: Time.now
)
dhh_p = Profile.create(
    user_id: dhh.id,
    user_information: {
        'first_name' => 'David',
        'last_name' => 'Heinemeier Hansson',
        'phone_number' => '6155559090',
        'user_bio' => 'I am the creator of Ruby on Rails, cofounder & CTO at Basecamp, best-selling author, Le Mans class-winning racing driver, frequent podcast guest, and family man.',
        'externals' => {
            'github' => 'https://github.com/dhh',
            'twitter' => 'https://twitter.com/dhh',
            'facebook' => '',
            'instagram' => '',
            'site' => 'https://dhh.dk/'
        }
    }
)
dhh_p.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/dhh.jpg'), filename: 'dhh.jpg')


chris = User.create(
    email: 'chris@hey.com',
    password: 'letsgorails',
    confirmed_at: Time.now
)
chris_p = Profile.create(
    user_id: chris.id,
    user_information: {
        'first_name' => 'Chris',
        'last_name' => 'Olvier',
        'phone_number' => '6155559191',
        'user_bio' => 'Ruby on Rails and Python developer on both desktop and web applications. Specialties: Ruby, Python, cross-platform software development, web applications, Linux, software architecture, web application security.',
        'externals' => {
            'github' => 'https://github.com/excid3',
            'twitter' => 'https://twitter.com/excid3?lang=en',
            'facebook' => '',
            'instagram' => '',
            'site' => 'https://gorails.com/'
        }
    }
)
chris_p.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/chris.jpeg'), filename: 'chris.jpeg')


ray = User.create(
    email: 'ray@hey.com',
    password: 'fuxwitdadom',
    confirmed_at: Time.now
)
ray_p = Profile.create(
    user_id: chris.id,
    user_information: {
        'first_name' => 'Ray',
        'last_name' => 'Villalobos',
        'phone_number' => '6155559292',
        'user_bio' => 'Focused on front-end design and development topics such as JavaScript, AngularJS, React, and Sass, plus frameworks like Bootstrap and tools that can make you a faster, more efficient developer.',
        'externals' => {
            'github' => 'https://github.com/planetoftheweb',
            'twitter' => 'https://twitter.com/planetoftheweb?lang=en',
            'facebook' => '',
            'instagram' => '',
            'site' => 'https://raybo.org/'
        }
    }
)
ray_p.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/ray.jpg'), filename: 'ray.jpg')


kevin = User.create(
    email: 'kevin@hey.com',
    password: 'getmoreoutofrails',
    confirmed_at: Time.now
)
kevin_p = Profile.create(
    user_id: chris.id,
    user_information: {
        'first_name' => 'Kevin',
        'last_name' => 'Skoglund',
        'phone_number' => '6155559394',
        'user_bio' => 'Programmer, Teacher, Digital Security Consultant, Voting Integrity Advocate',
        'externals' => {
            'github' => 'https://github.com/kevinskoglund',
            'twitter' => 'https://twitter.com/kskoglund',
            'facebook' => 'https://www.facebook.com/kevin.skoglund',
            'instagram' => '',
            'site' => 'http://www.kevinskoglund.com/'
        }
    }
)
kevin_p.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/kevin.jpg'), filename: 'kevin.jpg')


kevin = User.create(
    email: 'kevin@hey.com',
    password: 'getmoreoutofrails',
    confirmed_at: Time.now
)
kevin_p = Profile.create(
    user_id: chris.id,
    user_information: {
        'first_name' => 'Kevin',
        'last_name' => 'Skoglund',
        'phone_number' => '6155559394',
        'user_bio' => 'Programmer, Teacher, Digital Security Consultant, Voting Integrity Advocate',
        'externals' => {
            'github' => 'https://github.com/kevinskoglund',
            'twitter' => 'https://twitter.com/kskoglund',
            'facebook' => 'https://www.facebook.com/kevin.skoglund',
            'instagram' => '',
            'site' => 'http://www.kevinskoglund.com/'
        }
    }
)
kevin_p.profile_image.attach(io: File.open(File.expand_path(__FILE__).split('/backbone-bdd')[0] + '/backbone-bdd/development_data/kevin.jpg'), filename: 'kevin.jpg')



# frozen_string_literal: true
FactoryGirl.define do
  factory :profile do
    name { Faker::Superhero.name }
    fio { Faker::Name.name }
    expectations { Faker::Lorem.sentence(10) }
    location { Faker::Address.city }
    description { Faker::Lorem.sentence(10) }
    category { Faker::Commerce.department }
    money_from { rand(1000) }
    money_to { 1000 + rand(2000) }
    skype { Faker::Hacker.noun }
    linkedin { Faker::Hacker.noun }
    site { Faker::Internet.domain_name }

    after(:build) do |profile|
      profile.photo = File.open(File.join(Rails.root, 'spec', 'factories', 'photo_files', 'test_photo.png'))
      profile.cv = File.open(File.join(Rails.root, 'spec', 'factories', 'cv_files', 'cv.pdf'))
    end
  end
end

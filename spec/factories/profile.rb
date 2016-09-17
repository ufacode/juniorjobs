# frozen_string_literal: true
FactoryGirl.define do
  factory :profile do
    name 'Patrick'
    fio 'Bateman'
    expectations 'money'
    location 'Gotham'
    descriprion 'some text'
    category 'wall_str'
    money_from '10'
    money_to '20'
    skype 'patrick1'
    linkedin 'PBateman'
    site 'psycho.net'
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root('spec', 'factories', 'photo_files', 'test_photo.png'))) }
    cv { Rack::Test::UploadFile.new(File.join(Rails.root('spec', 'factories', 'cv_files', 'cv.pdf'))) }
  end
end

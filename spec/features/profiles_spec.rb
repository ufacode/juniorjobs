require 'rails_helper'

feature 'Profile create' do 
  scenario "add a new profile" do
    user = create(:profile)

    visit_root_path
    click_button '.add_profile'
    fill_in 'photo' with: attach_file("Upload Your File", Rails.root + "spec/fixtures/")
    fill_in 'cv' with: attach_file("Upload Your File", Rails.root + "spec/fixtures/")
    fill_in 'fio' with: "Christian Bale"
    fill_in 'name' with: "Patrick"
    fill_in 'description' with: "Bateman or Batman"
    fill_in 'money_from' with: "1000"
    fill_in 'money_to' with: "10000"
    fill_in 'location' with: "Gotham"
    fill_in 'category' with: "Good hero"
    fill_in 'expectations' with: "work with Robin"
    fill_in 'linkedin' with: "btmn"
    fill_in 'skype' with: "xxxbatmanxxx"
    fill_in 'site' with: "www.batman.com"
    fill_in 'email' with: "catchmymail@bat.com"
    click_button '.submit'
    expect()
end
do
    before (:all) do 
      user = FactoryGirl.create(:user)
      user.confirmed_at = Time.now
      user.save
    end
  scanerio "displays user email" do before
  end

    user = create(:profile)
    visit_root_path
    click_button '.add_profile'
    page.should have_content(user.email)
end
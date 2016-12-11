Rspec.describe profile_create do 
	context 'with validation' do
		it 'has a valid profile and user factory' do
		expect(FactoryGirl.build(:profile)).to be_valid
		expect(FactoryGirl.build(:user)).to be_valid
end
		it 'has a valid profile when user logged in' do
			FactoryGirl.create(:user) do |user|
  user.profile.build(attributes_for(:profile))
end
end
end

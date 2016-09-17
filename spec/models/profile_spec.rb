# frozen_string_literal: true
RSpec.describe Profile, type: :model do
  describe Profile do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:profile)).to be_valid
    end
    it 'is invalid without fio' do
      profile = FactoryGirl.build(:profile, fio: nil)
      profile.valid?
      expect(profile.errors[:fio]).to include "can't be blank"
    end
    it 'is invalid without name' do
      profile = FactoryGirl.build(:profile, name: nil)
      profile.valid?
      expect(profile.errors[:name]).to include "can't be blank"
    end
    it 'is invalid without description' do
      profile = FactoryGirl.build(:profile, descriprion: nil)
      profile.valid?
      expect(profile.errors[:descriprion]).to include "can't be blank"
    end
    it 'is invalid without expectations' do
      profile = FactoryGirl.build(:profile, expectations: nil)
      profile.valid?
      expect(profile.errors[:expectations]).to include "can't be blank"
    end
    it 'is invalid without location' do
      profile = FactoryGirl.build(:profile, location: nil)
      profile.valid?
      expect(profile.errors[:location]).to include "can't be blank"
    end
  end
end

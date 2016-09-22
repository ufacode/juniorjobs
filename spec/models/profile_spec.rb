# frozen_string_literal: true
RSpec.describe Profile, type: :model do
  context 'with validation' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:profile)).to be_valid
    end

    it 'is invalid without fio' do
      profile = FactoryGirl.build(:profile, fio: nil)
      profile.valid?
      expect(profile.errors[:fio].count).to be > 0
    end

    it 'is invalid without name' do
      profile = FactoryGirl.build(:profile, name: nil)
      profile.valid?
      expect(profile.errors[:name].count).to be > 0
    end

    it 'is invalid without description' do
      profile = FactoryGirl.build(:profile, description: nil)
      profile.valid?
      expect(profile.errors[:description].count).to be > 0
    end

    it 'is invalid without expectations' do
      profile = FactoryGirl.build(:profile, expectations: nil)
      profile.valid?
      expect(profile.errors[:expectations].count).to be > 0
    end

    it 'is invalid without location' do
      profile = FactoryGirl.build(:profile, location: nil)
      profile.valid?
      expect(profile.errors[:location].count).to be > 0
    end
    it 'is invalid when money to lower than money from' do
      profile = FactoryGirl.build(:profile, money_from: 3001)
      profile.valid?
      expect(profile.errors[:money_from_cannot_be_greater_than_money_to].count).to be > 0
    end
  end
end

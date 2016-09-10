# frozen_string_literal: true
RSpec.describe User, type: :model do
  subject { FactoryGirl.build(:user) }

  context 'with validation' do
    it 'checks empty name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].count).to be > 0
    end

    it 'checks empty email' do
      subject.email = nil
      subject.valid?
      expect(subject.errors[:email].count).to be > 0
    end

    it 'checks uniqueness of email' do
      create(:user, name: subject.name, email: subject.email, password: subject.password)
      subject.valid?
      expect(subject.errors[:email].count).to be > 0
    end
  end

  describe '#confirmation_token' do
    it 'create token' do
      subject.confirm_token = nil
      subject.save
      expect(subject.confirm_token).not_to be_nil
    end
  end
end

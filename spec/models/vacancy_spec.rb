require 'rails_helper'
require 'spec_helper'

describe Vacancy do 
	it "it expire_date it's not nil" do
		vacancy1 = Vacancy.create(expire: 7)
		vacancy2 = Vacancy.create(expire: 14)
		vacancy3 = Vacancy.create(expire: 30)
		expect(vacancy1.expire).to eq 7
		expect(vacancy2.expire).to eq 14
		expect(vacancy3.expire).to eq 30
 end
end
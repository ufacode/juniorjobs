require 'rails_helper'
require 'spec_helper'

describe "vacancies_controller" do 
	subject { page }
	describe "show action" do 
		let(:vacancy) { FactoryGirl.create(:vacancy) }
		response.should render_template('show')
	end
end
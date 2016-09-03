FactoryGirl.define do
	factory :vacancy do 
		name "Super Ruby jobs"
		kind "temporary"
		description "We are looking for Frontend AngularJs/RoR developer, with the proficiency in AngularJS, RoR, PostgreSQL, TDD.
    This is a Part-time job for Senior|Middle level employees.
    Location: Moscow, Russia. The company is ok with remote jobs.
    Salary is negotiable accourding to your expectations, although it is around $11+ Per hour."
    location "Moscow"
    remote true
    company "InterCross"
    site "http://intercross.com"
    phone "+79273928107"
    contact_to "Kamill"
    expire 1
	end
end
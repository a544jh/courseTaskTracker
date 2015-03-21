FactoryGirl.define do
  factory :user do
    name "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end
  
  factory :course do
	name "Käjä"
	description "Käyttöjärjestelmät"
  end
end

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

  factory :task_set do
    name "Laskarit"
    deadline DateTime.new(2000,1,1)
  end

  factory :task do
    name "Tehtävä"
  end

end

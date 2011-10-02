Factory.define :activity do |activity|
	activity.name				"Test Activity"
end

Factory.define :user do |user|
  user.first_name            "Michael"
	user.last_name					   "Hartl"
	user.user_name						 "mhartl"
  user.email                 "mhartl@example.com"
	user.email_confirmation		 "mhartl@example.com"
	user.domain								 "simpleplan.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
	
end
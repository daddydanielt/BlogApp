Fabricator(:user) do
  temp_password  =  Faker::Internet.password(6,10)
  #email { Faker::Name.name }
  email { Faker::Internet.email }
  password { temp_password }
  password_confirmation { temp_password }
end
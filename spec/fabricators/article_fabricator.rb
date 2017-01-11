Fabricator(:article) do
  user
  title { Faker::Book.title }
  body { Faker::Lorem.sentence }
end
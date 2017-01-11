Fabricator(:article) do
  author
  title { Faker::Book.title }
  body { Faker::Lorem.sentence }
end
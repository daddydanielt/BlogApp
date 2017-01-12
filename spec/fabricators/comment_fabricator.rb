Fabricator(:comment) do
  user
  article
  body { Faker::Lorem.sentence }
end
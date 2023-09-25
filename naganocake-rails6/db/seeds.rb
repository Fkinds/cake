unless Admin.exists?(id: 1)
Admin.create!(
  email: "test@test",
  password: "password"
)
end

Genre.create!(
  name: "ケーキ"
)

Genre.create!(
  name: "プリン"
)

Item.create!(
  genre_id: "1",
  name: "test1",
  price: "10000",
  introduction: "test1",
  is_sold: false
)

Item.create!(
  genre_id: "2",
  name: "test2",
  price: "10000",
  introduction: "test2",
  is_sold: true
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

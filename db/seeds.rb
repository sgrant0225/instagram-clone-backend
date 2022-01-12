# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sharnell = User.create(
    username: 'solaya_reign', 
    email: 'testemail.com', 
    password_digest: '123', 
    bio: 'Welcome to my world', 
    photo: 'https://avatars.githubusercontent.com/u/50125301?v=4'
)

Post.create(
 photo: "https://avatars.githubusercontent.com/u/50125301?v=4",
 likes: 1,
 comment: " This os my fist post",
 user_id: sharnell.id
)


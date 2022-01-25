# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sharnell = User.create(
    username: 'solaya_reign', 
    email: 'test@email.com', 
    password: '123', 
    bio: 'Welcome to my world', 
    photo: 'https://avatars.githubusercontent.com/u/50125301?v=4'
)

terrence = User.create(
    username: 'kingfullyauto',
    email: 'king@email.com',
    password: '123',
    bio: 'Worlds greatest rapper',
    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwtb9ZuR4kvaR8ZS4IIkIiX0eNDqYHdHNWew&usqp=CAU"
)

Post.create([
 {
    image: "https://avatars.githubusercontent.com/u/50125301?v=4",
    likes: 1,
    caption: "This is my first post",
    user_id: sharnell.id
},   
 {
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwtb9ZuR4kvaR8ZS4IIkIiX0eNDqYHdHNWew&usqp=CAU",
    likes: 1,
    caption: "Hey Y'all",
    user_id: terrence.id 
 }


])


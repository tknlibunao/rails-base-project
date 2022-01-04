# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create the roles (admin, buyer)
Role.create(name: :admin)
Role.create(name: :buyer)

user1 = User.create(email: 'admin@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'admin', user_type: 'Admin')
user1.add_role(:admin)

user2 = User.create(email: 'tknlibunao@gmail.com', password: '12345678', password_confirmation: '12345678', username: 'tknlibunao', user_type: 'Buyer')
user2.add_role(:buyer)

# In the users_controller.rb, add something like
# def set_role
#   if user.user_type == 'Admin'
#     user.add_role(:admin)
#   elsif user.user_type == 'Buyer'
#     user.add_role(:buyer)
#   else
#     # user.add_role(:guest)
#   end
# end
#
# Use after_create :set_role

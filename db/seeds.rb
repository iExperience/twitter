# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

User.destroy_all
user = User.create(handle: "@daretorant", name: "Salman Ansari", email: "salman@ixperience.co.za", password: "password", password_confirmation: "password")

Tweet.destroy_all
tweets = Tweet.create([
    {body: "Howzit bru!", user_id: user.id, :latitude => -33.9253, :longitude => 18.4239},
    {body: "NEW HAVEN WHAT UP!", user_id: user.id, :latitude => 41.31, :longitude => -72.9236},
    {body: "This fog is so beautiful...", user_id: user.id, :latitude => 37.7833, :longitude => -122.4167},
    {body: "BRRRUAAAH", user_id: user.id, :latitude => 18.975, :longitude => 72.8258}
  ])
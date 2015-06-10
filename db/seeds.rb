# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

User.destroy_all
user = User.create(handle: "@daretorant", name: "Salman Ansari")

Tweet.destroy_all
tweets = Tweet.create([
    {body: "<3. DUH. GREATER THAN THREE.", user_id: user.id},
    {body: "word up.", user_id: user.id},
    {body: "yo yo.", user_id: user.id},
    {body: "i am clearly excited.", user_id: user.id}
  ])
class Hashtag < ActiveRecord::Base
  has_many :hashtag_tweets
  has_many :tweets, through: :hashtag_tweets
end


# JOIN TABLE 
# tweet_id | hashtag_id
# _________|___________
#        1            2
#        1            5
#        3            4


# Cart  and Item

# cart_id | item_id
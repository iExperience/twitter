# == Schema Information
#
# Table name: hashtags
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

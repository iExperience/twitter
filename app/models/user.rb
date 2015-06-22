# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  handle                 :string
#  name                   :string
#  created_at             :datetime
#  updated_at             :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :tweets, dependent: :destroy

  validates(:handle, :presence => true)

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
    user.name = auth.info.name
    user.email = auth.info.email
    user.handle =  user.name.downcase.gsub(" ","")

    # unless the user was already created
    unless user.persisted?
      random_password = Devise.friendly_token[0,20]
      user.password = random_password
      user.password_confirmation = random_password
    end

    user.save

    user
  end

  def profile_pic
    case self.provider
    when "facebook" then "http://graph.facebook.com/#{self.uid}/picture"
    else 
      self.avatar_file_name ? self.avatar.url(:thumb) : "FatCatMoon.jpg"
    end
  end
end

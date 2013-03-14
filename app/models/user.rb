# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#

class User < ActiveRecord::Base
   attr_accessible :name, :email, :password, :password_confirmation, :admin
   has_secure_password
   has_many :assets
   
   before_save { |user| user.email = email.downcase }
   before_save :create_remember_token
   after_save :toggle_admin
   
   validates :name,  presence: true, length: { maximum: 80 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
             uniqueness: { case_sensitive: false }
             
   validates_presence_of :password, length: { minimum: 6 }, on: :create
   validates_presence_of :password_confirmation, presence: true, on: :create
   
   def feed
     Asset.where("user_id = ?", id)
   end
   
   def send_password_reset
     create_reset_token
     self.password_reset_sent_at = Time.zone.now
     save!
     UserMailer.password_reset(self).deliver
   end
   
   private 
   
     def create_remember_token
       self.remember_token = SecureRandom.urlsafe_base64
     end
     
     def create_reset_token
       self.password_reset_token = SecureRandom.urlsafe_base64
     end

     def toggle_admin
      if self.admin == true
        self.toggle!(:admin)
      end
    end
end
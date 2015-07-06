# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime
#  updated_at      :datetime
#  email           :string(50)       default("")
#  username        :string(50)
#  password_digest :string(255)
#  remember_token  :string(255)
#  account_type    :string(50)
#  has_account     :boolean          default(FALSE)
#  name_first      :string(50)
#  name_last       :string(50)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  
    attr_accessible :username, 
                    :email, 
                    :account_type, 
                    :has_account, 
                    :password, 
                    :password_confirmation, 
                    :name_first, 
                    :name_last, 
                    :admin

    
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :username, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 4 }
    

    
    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
    

  
    private
  
      def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
      end
    
    
  
end

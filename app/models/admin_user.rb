# == Schema Information
#
# Table name: admin_users
#
#  id                     :integer          not null, primary key
#  email                  :string(100)      default(""), not null
#  hashed_password        :string(40)
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(25)
#  salt                   :string(40)
#  name_first             :string(50)
#  name_last              :string(50)
#  password_digest        :string(255)
#  remember_token         :string(255)
#  admin                  :boolean          default(FALSE)
#  super_admin            :boolean          default(FALSE)
#  auth_token             :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#

class AdminUser < ActiveRecord::Base
  
  attr_accessible :name_first, 
                  :name_last, 
                  :email, 
                  :username, 
                  :password, 
                  :password_confirmation,
                  :admin,
                  :super_admin


    has_many :admin_user_images
    
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    validates :username, presence: true, length: { maximum: 50 }, on: :create
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }, on: :create
    has_secure_password
    validates :password, length: { minimum: 4 }, on: :create
    
  
      
    
    def AdminUser.new_remember_token
      SecureRandom.urlsafe_base64
    end
  
    def AdminUser.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  
  
    def next
      AdminUser.where("id > ?", self.id).first
    end
    
    def previous
      AdminUser.where("id < ?", self.id).last
    end
  
  
    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      AdminUserMailer.password_reset(self).deliver
    end
  
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while AdminUser.exists?(column => self[column])
    end

    
    def self.dbdelete
        self.connection.execute("DELETE FROM admin_users")
    end
    
    def self.dbclear
        self.connection.execute("ALTER SEQUENCE admin_users_id_seq RESTART WITH 1")
    end
    
  
    private
  
      def create_remember_token
        self.remember_token = AdminUser.encrypt(AdminUser.new_remember_token)
      end
  
end

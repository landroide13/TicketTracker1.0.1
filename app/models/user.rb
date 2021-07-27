class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :first_name, presence: true, length: { minimum: 3, maximum: 15}
  validates :last_name, presence: true, length: { minimum: 3, maximum: 35}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, presence: true, length: { minimum: 5, maximum: 100},
            uniqueness: { case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }

end

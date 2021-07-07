class Student < ApplicationRecord
  belongs_to :teacher
  has_many :scores
  has_many :messages
  has_secure_password
  
  validates :name, 
    presence: true,
    length: { minimum: 4 , maximum: 20},
    format: {
        with: /\A[a-z0-9]+\Z/
    }
  validates :password, 
    presence: true,
    length: { minimum: 4 , maximum: 20},
    format: {
        with: /\A[a-z0-9]+\Z/
    }

  validates :teacher_id, presence: true
    
  
end

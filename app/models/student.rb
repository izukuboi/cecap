class Student < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :programs, through: :payments
  has_many :gradepractices
  has_many :gradeevaluations
  has_many :evaluations, through: :gradeevaluations
  has_many :practices, through: :gradepractices
end

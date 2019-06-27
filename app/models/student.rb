class Student < ApplicationRecord
  belongs_to :user
  has_many :payments
  has_many :programs, through: :payments
  has_many :grade_practices
  has_many :grade_evaluations
  has_many :evaluations, through: :grade_evaluations
  has_many :practices, through: :grade_practices
end

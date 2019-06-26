class Program < ApplicationRecord
    
    
    validates :nombrePrograma, presence: true
    validates :description, presence: true
    has_many :courses , dependent: :destroy
    #has_and_belongs_to_many :students
    belongs_to :tutor, optional: true
    has_many :payments
    has_many :students, through: :payments
end

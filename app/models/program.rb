class Program < ApplicationRecord
    
    
    validates :nombrePrograma, presence: true
    validates :description, presence: true
    has_many :courses , dependent: :destroy
    belongs_to :tutor
end

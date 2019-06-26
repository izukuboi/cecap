class Evaluation < ApplicationRecord
    belongs_to :course
    mount_uploader :attachment, AttachmentUploader
    has_many :gradeevaluations
    has_many :students, through: :gradeevaluations
    
end

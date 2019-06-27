class Evaluation < ApplicationRecord
    belongs_to :course
    mount_uploader :attachment, AttachmentUploader
    has_many :grade_evaluations
    has_many :students, through: :grade_evaluations
    
end

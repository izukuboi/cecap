class GradeEvaluation < ApplicationRecord
    belongs_to :student
    belongs_to :evaluation
    mount_uploader :attachment, AttachmentUploader
    

end

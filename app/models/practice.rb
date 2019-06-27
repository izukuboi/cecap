class Practice < ApplicationRecord
    belongs_to :course
    mount_uploader :attachment, AttachmentUploader
    has_many :grade_practices
    has_many :students, through: :grade_practices
end

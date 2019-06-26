class Practice < ApplicationRecord
    belongs_to :course
    mount_uploader :attachment, AttachmentUploader
    has_many :gradepractices
    has_many :students, through: :gradepractices
end

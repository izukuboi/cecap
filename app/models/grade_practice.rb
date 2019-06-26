class GradePractice < ApplicationRecord
    belongs_to :student
    belongs_to :practice
    mount_uploader :attachment, AttachmentUploader
end

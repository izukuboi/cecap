class Material < ApplicationRecord
    belongs_to :course
    mount_uploader :attachment, AttachmentUploader
    
end

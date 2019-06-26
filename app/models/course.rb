class Course < ApplicationRecord
   #mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
   #validates :name, presence: true # Make sure the owner's name is present.
   belongs_to :program
   belongs_to :tutor
   has_many :evaluations
   has_many :practices
   has_many :materials
end

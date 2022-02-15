

class Book < ApplicationRecord
    # has_one_attached :image
    has_one_attached :file 
 belongs_to :auther
   
  validate :correct_document_mime_type

  private

  def correct_document_mime_type
    if file.attached? && !file.content_type.in?(%w(application/pdf))
      errors.add(:file, 'Must be a PDF or a DOC file')
    end
  end
end

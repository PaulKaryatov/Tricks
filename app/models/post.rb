class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :files
  has_many_attached :vids
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
  validate  :check_files_type
#  validates :files, content_type: [:png, :jpg, :jpeg]
  default_scope -> { order(created_at: :desc) }


  private
  def check_files_type
  	return unless files.attached?
  	files.each do |file|
  	  if !file.content_type.in?(%('image/jpeg image/png'))
  		errors.add(:file, "should be jpg or png")

  	  end
  	end
  end	
end

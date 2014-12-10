class Outfit < ActiveRecord::Base
  # Validate these exist before creating
  validates :description, :image, :name, presence: true

  # This method associates the attribute ":image" with a file attachment
	# '>' specifies resize option for imagemagick
  has_attached_file :image, styles: { medium: "800x800>", thumb: "100x100>" }

 	# Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

class Outfit < ActiveRecord::Base
	# This method associates the attribute ":image" with a file attachment
	# '>' specifies resize option for imagemagick
 	has_attached_file :image, styles: { medium: "450x800>", thumb: "100x100>" }

 	# Validate the attached image is image/jpg, image/png, etc
 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end

class Horror < ApplicationRecord

     mount_uploader :image, ImageUploader
    
     has_many :horror_tag_relations, dependent: :destroy
  
     has_many :tags, through: :horror_tag_relations, dependent: :destroy
end


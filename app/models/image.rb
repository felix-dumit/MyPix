class Image < ActiveRecord::Base

attr_accessible :name, :group, :private, :pic
    VALID_IMAGE_REGEX = /[^\s]+(\.(?i)(jpg|png|gif|bmp))$/
validates :name, :presence => true  
validates :user_id, :presence => true
has_attached_file :pic, :styles =>
 { :medium => "300x300>", :thumb => "100x100>" } 

belongs_to :user


end


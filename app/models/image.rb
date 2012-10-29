class Image < ActiveRecord::Base

    attr_accessible :name, :group, :private, :pic
    VALID_IMAGE_REGEX = /[^\s]+(\.(?i)(jpg|png|gif|bmp))$/
    validates :name, :presence => true
    validates :user_id, :presence => true
    has_attached_file :pic, :styles =>
    {:large => "500x500>", :medium => "300x300>", :small => "200x200>", :thumb => "100x100>" }
    validates_attachment_content_type :pic, :content_type => ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'],
    :message => "Only jpeg, gif and png files are allowed for profile pictures"

    belongs_to :user


end


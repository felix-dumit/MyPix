class AddPicPaperclip < ActiveRecord::Migration 
def self.up 
add_column :images, :pic
end 
def self.down 
remove_column :images, :pic 
end 

def change
add_attachment :images, :pic
end

end

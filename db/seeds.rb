# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


Gallery.create(:name => "WELLINGTON")
Gallery.create(:name => "Nature")
Gallery.create(:name => "Portrait")
Gallery.create(:name => "Fine Art")


User.new({:email => "pelletj@gmail.com", :password => "chartreuse", :password_confirmation => "chartreuse" }).save 

repository = "/home/jpellet/DEV/julienpellet.com-php/gallery/all"

Dir.glob(repository+"/**/*").each do |file|
  if !File.directory?(file)

     cdn_filename = file.gsub(repository,"http://192.168.1.67/jp/gallery/all")

    if !cdn_filename['thumb']
      thumb_url = cdn_filename.gsub('images','thumbs')

      Picture.create(:url => cdn_filename, :thumb_url => thumb_url, :title => "test title", :caption => "test caption", :gallery_id =>2 )
    end
  end
end



#!/usr/bin/env ruby -w

CAMERA_UPLOADS = File.join("/", "Users", "mattharmes", "Dropbox", "Camera Uploads")
PHOTOS_FROM_IPHOTO = File.join("/", "Users", "mattharmes", "Dropbox", "Photos from iPhoto")

def read_folder(folder)
  items = []

  Dir.entries(folder).each do |item|
    full_path = File.join(folder, item)

    unless item.start_with? "."
      if File.directory? full_path
        items << read_folder(full_path)
      else
        items << item
      end
    end
  end

  items.flatten
end

camera_upload_files = read_folder(CAMERA_UPLOADS).sort
photos_from_iphoto_files = read_folder(PHOTOS_FROM_IPHOTO).sort

camera_upload_files.each do |i|
  puts "#{i} not in Photos from iPhoto." unless photos_from_iphoto_files.include? i
end

photos_from_iphoto_files.each do |i|
  puts "#{i} not in Camera Uploads." unless camera_upload_files.include? i
end

# == Schema Information
#
# Table name: share_files
#
#  id              :integer          not null, primary key
#  name_originator :string(50)
#  name_file       :string(50)
#  created_at      :datetime
#  updated_at      :datetime
#

class Upload < ShareFile
  
  
  def self.save(upload)
    name =  upload_file['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload_file['datafile'].read) }
  end  
  
end

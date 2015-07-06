# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Weblearnadmin::Application.initialize!

Time::DATE_FORMATS[:day_month_year] = "%b %d %Y"

# location of the Image Magick command files
Paperclip.options[:command_path] = "/usr/local/bin"

require 'csv'
require 'fileutils'
require 'pathname'

location = ARGV[0]

path = Pathname.new(location)

path.each_child do |folder|
  puts folder.children
end

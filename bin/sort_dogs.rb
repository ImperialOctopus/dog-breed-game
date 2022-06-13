require 'csv'
require 'fileutils'
require 'pathname'

location = ARGV[0]

csv = CSV.read(location + '/dog_breed_photos.csv', headers: true)

csv.each do |line|
  oldLoc = Pathname.new(location + '/dog_breed_photos/' + line['Image'].strip).cleanpath
  unless oldLoc.exist?
    puts line['Image'] + '    ####    SKIPPED'
    next
  end

  breedPath = line['Breed'].strip.gsub(/[^A-Za-z0-9\-_. ]/, '')
  newLoc = Pathname.new(location + '/dog_breed_photos/' + breedPath).cleanpath
  newLoc.mkdir unless newLoc.exist?

  FileUtils.move(oldLoc, newLoc)
  puts line['Image'] + '    ===>    ' + line['Breed']
end

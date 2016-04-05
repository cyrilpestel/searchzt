#!/usr/bin/ruby

require_relative 'ZTSearchProvider'

filepath = ARGV[0]
#puts term
#puts quality

if filepath
	begin
    	file = File.new(filepath, "r")
	    while (line = file.gets)
	        term,neededQuality = line.split(",")

			provider = ZTSearchProvider.new()
			provider.search(term, neededQuality)
	    end
	    file.close
	rescue => err
	    puts "Exception: #{err}"
	    err
	end
else
	puts "Specify a file"
end
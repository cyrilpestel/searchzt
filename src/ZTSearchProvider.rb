require 'rubygems'
require 'nokogiri'
require 'open-uri'
require "cgi"

require_relative 'Util'

class ZTSearchProvider
	def search(term, neededQuality)
		termEncoded = CGI::escape(term)

		url = "http://www.zone-telechargement.com/films-gratuit.html?q=#{termEncoded}&minrating=0&tab=all&orderby_by=popular&orderby_order=desc"
		puts "============================================"
		puts "Looking for : #{term}"
		puts "Getting url : #{url}"
		puts "============================================"
		begin
			page = Nokogiri::HTML(open(url))
		
			results = page.css("div[class='cover_infos_title'] a")

			util = Util.new()

			results.each { |result|
				found = false
				#details = result.css("span[class='detail_release size_11'] span")
				#quality = details[0]
				#lang = details.css("span")[1]
				#puts quality
				if !neededQuality 
					found = true
				else
					found = util.matchQuality(result,neededQuality)
				end

				if found
					puts " + #{result.text} - #{result['href']}"
					#puts quality.text
					# puts result["href"]
					# puts "============================================"
				end
			}
		rescue OpenURI::HTTPError => error
		  response = error.io
		  response.status
		end 
	end
end

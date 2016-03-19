require 'rubygems'
require 'nokogiri'
require 'open-uri'
require "cgi"

require_relative 'ZTSearchProvider'

term,neededQuality = ARGV
#puts term
#puts quality

provider = ZTSearchProvider.new()

provider.search(term, neededQuality)
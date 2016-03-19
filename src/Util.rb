
class Util
	def matchQuality(result, neededQuality)
		details = result.css("span[class='detail_release size_11'] span")
		quality = details[0]
		neededQualities = neededQuality.split("|")
		neededQualities.each { |qul|
			if quality.text == qul 
				return true 
			end
		}
		return false
	end
end


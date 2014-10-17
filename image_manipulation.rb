require './image_array.rb'

puts "What is your image file name?"
image_path = gets.chomp

imge = ImageArray.new(image_path)

puts "Which transformation would you like done to the image - random noise, tint, equal, or inverse?"

command = gets.chomp

if command == "random noise"
	puts "One moment..."
	imge.each do |row|
		row.each do |pixel|
			pixel.red = rand(pixel.red)
			pixel.blue = rand(pixel.blue)
			pixel.green = rand(pixel.green)
		end
	end


imge.write ("./image_rnoise.jpg")

puts "Your random noise image is now called image_rnoise.jpg"


elsif command == "tint"
	puts "Which colored tint would you like - red, blue, or green?"
	color = gets.chomp
		if color == "red"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.red = imge.max_intensity
				end
			end
			
			imge.write ("./image_red.jpg")
		
			puts "Your red tint image is now called image_red.jpg"
		
		
		elsif color == "blue"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.blue = imge.max_intensity
				end
			end
			
			imge.write ("./image_blue.jpg")
		
			puts "Your blue tint image is now called image_blue.jpg"

	
		elsif color == "green"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.green = imge.max_intensity
				end
			end

			imge.write ("./image_green.jpg")
	
			puts "Your green tint image is now called image_green.jpg"
		
		else 
			puts "Not valid color"
	
		end


elsif command == "equal"
	puts "Which colors would you like to equalize: red/green, red/blue, blue/green?"
	colors = gets.chomp

		if colors == "red/green"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.red = pixel.green
					pixel.green = pixel.red
	
				end
			end
		end

		if colors == "red/blue"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.red = pixel.blue
					pixel.blue = pixel.red
				end
			end
		end
		
		if colors == "blue/green"
			puts "One moment..."
			imge.each do |row|
				row.each do |pixel|
					pixel.blue = pixel.green
					pixel.green = pixel.blue
				end
			end
		end
	
	imge.write ("./image_equal.jpg")

	puts "Your image is now called image_equal.jpg"

elsif command == "inverse"
	puts "One moment..."
	imge.each do |row|
		row.each do |pixel|
			pixel.red = imge.max_intensity - pixel.red
			pixel.blue = imge.max_intensity - pixel.blue
			pixel.green = imge.max_intensity - pixel.green
		end
	end

	imge.write ("./image_inv.jpg")

	puts "Your inverse image is now called image_inv.jpg"

else 
	puts "Not valid effect"
end

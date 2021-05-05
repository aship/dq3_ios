
require "RMagick"
require "csv"
require "fileutils"

include Magick

filename = ARGV[0]

unless filename
  puts "please set input image filename"
  puts "ex. % ruby divide_into_tile.rb hoge.jpg"
  exit
end

unless File.exist?(filename)
  puts "no such file #{filename}"
  exit
end

image_load = ImageList.new(filename)
# image_load = Magick::Image.read('field.png').first

width = image_load.columns
height = image_load.rows

puts " width #{width}"
puts " height #{height}"

sprite_x_count = width / 16
sprite_y_count = height / 16

tile_count = 0

FileUtils.mkdir_p("output")

metric = Magick::PeakSignalToNoiseRatioErrorMetric

tilemap_csv = CSV.open('tilemap.csv','w')
    
for num_y in 0 .. sprite_y_count - 1 do
  pos_y = num_y * 16

  array = []

  for num_x in 0..sprite_x_count - 1 do
    pos_x = num_x * 16

   # puts " "
   # puts "------------"
    puts "analysing x #{num_x} / #{sprite_x_count - 1}, y: #{num_y} / #{sprite_y_count - 1}"

    image_cropped = image_load.crop(pos_x, pos_y, 16, 16)

    if tile_count == 0
      image_name = "#{tile_count}.png"

    #  puts "writing #{image_name}"
 
      image_cropped.write("output/#{image_name}")

      array.append(" 0")

      tile_count += 1
    else
      # 過去に同じのないかチェック
      is_matched = false

      for num_tile in 0 .. tile_count - 1 do
      	image_tile_name = "#{num_tile}.png"
        image_tile = ImageList.new("output/#{image_tile_name}")

        diff = image_cropped.compare_channel(image_tile, metric)[1]

      #  puts "check match diff #{diff}"

        if diff == Float::INFINITY
       #   puts "matched"
          is_matched = true

          string = sprintf("%2d", num_tile)

          array.append(string)

          break
        end
      end

      unless is_matched
        # 一個もマッチしない
        image_name = "#{tile_count}.png"

     #   puts "writing #{image_name}"
 
        image_cropped.write("output/#{image_name}")

        string = sprintf("%2d", tile_count)

        array.append(string)

        tile_count += 1
      end
    end
  end

  tilemap_csv.puts array
end

tilemap_csv.close

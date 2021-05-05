
require "RMagick"
require "csv"
require "fileutils"

include Magick

ouput_folder_name = "output_combined"

FileUtils.mkdir_p(ouput_folder_name)

output_tmp_image_path = "#{ouput_folder_name}/tmp.png"
output_image_path = "#{ouput_folder_name}/combined.png"

csv_path = "tilemap.csv"

CSV.foreach(csv_path).with_index do |row, row_index|
  p "row_index = #{row_index}"

  column_0 = ""

  row.each_with_index do |column, column_index|
    if column_index == 0
      column_0 = column.to_i
    elsif column_index == 1
      image = Magick::ImageList.new("output/#{column_0}.png", "output/#{column.to_i}.png")
      # falseだと左右につなげる。trueだと上下につなげる
      image = image.append(false)
      image.write(output_tmp_image_path)
    elsif 1 < column_index
      image = Magick::ImageList.new(output_tmp_image_path, "output/#{column.to_i}.png")
      # falseだと左右につなげる。trueだと上下につなげる
      image = image.append(false)
      image.write(output_tmp_image_path)
    end
  end

  if row_index == 0
    FileUtils.cp(output_tmp_image_path, output_image_path)
  else
    image = Magick::ImageList.new(output_image_path, output_tmp_image_path)
    # falseだと左右につなげる。trueだと上下につなげる
    image = image.append(true)
    image.write(output_image_path)
  end
end

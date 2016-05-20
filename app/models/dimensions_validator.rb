class DimensionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.send("#{attribute}?".to_sym)
      magick = ::MiniMagick::Image.new(value.current_path)
      width = options[:width]
      height = options[:height]

      record.errors[attribute] << "Width must be #{width}px" unless magick[:width] == width
      record.errors[attribute] << "Height must be #{height}px" unless magick[:height] == height
    end
  end
end
class PublicImage
    def initialize(image_filename)
        @image_path = Rails.public_path.join('images', image_filename)
    end

    def to_base64
        image = File.read(@image_path)
        base64_image = Base64.encode64(image)

        return "data:image/jpg;base64,#{base64_image}"
    end
end
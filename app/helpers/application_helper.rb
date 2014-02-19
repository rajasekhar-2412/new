module ApplicationHelper

  def randomized_background_image
    path = "/home/sm/Downloads/My_sample/app/assets/images/"
    images=Dir.entries(path)
    @random_images = images[rand(images.size)]
  end

end

class Api::UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def basic_upload
    file = params[:file]

    if file
      begin
        # ext = File.extname(file.tempfile)
        cloud_image = Cloudinary::Uploader.upload(file, public_id: file.original_filename, secure: true, resource_type: :auto)
        # user.image = cloud_image['secure_url']
        # current.user.update(image: image.secure_url)
        render json: { yo: "worked", file: file, cloud_image: cloud_image }
      rescue => e
        render json: { errors: e }, status: 422
        return
      end
    end
  end

  def update_user_imagine
    file = params[:file]

    ## where we upload cloudinary
    cloud_image = basic_upload_helper(file)
    if (cloud_image)
      ## update/create to db we upload cloudinary
      current_user.update(image: cloud_image["secure_url"])
      render json: { data: current_user }
    else
      render json: { error: "error uploading image" }, status: 422
    end
  end

  ## returns image object if successfull and return false if unsuccesfull add to cloudianry
  def basic_upload_helper(file)
    if file
      begin
        # upload to cloudinary
        cloud_image = Cloudinary::Uploader.upload(file, public_id: file.original_filename, secure: true, resource_type: :auto)
        # user.image = cloud_image['secure_url']
        return cloud_image
      rescue => e
        return false
      end
    end
  end
end

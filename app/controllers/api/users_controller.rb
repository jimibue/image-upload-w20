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
        render json: { yo: "worked", file: file, cloud_image: cloud_image }
      rescue => e
        render json: { errors: e }, status: 422
        return
      end
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

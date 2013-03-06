class ImagesController < ApplicationController
  
  # PUT /images
  def update
    submission = Submission.find(params[:image][:imageable_id])
    image = submission.image 
    
    image.crop_x = params[:image][:crop_x]
    image.crop_y = params[:image][:crop_y]
    image.crop_w = params[:image][:crop_w]
    image.crop_h = params[:image][:crop_h]

    image.file.recreate_versions! if image.crop_x.present?
    
    redirect_to submission_path(submission)
  end
  
end

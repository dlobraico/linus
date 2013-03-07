class ImagesController < ApplicationController
  
  # PUT /images
  def update
    @submission = Submission.find(params[:image][:imageable_id])
    @image = @submission.image 
    
    @image.crop_x = params[:image][:crop_x].to_i
    @image.crop_y = params[:image][:crop_y].to_i
    @image.crop_w = params[:image][:crop_w].to_i
    @image.crop_h = params[:image][:crop_h].to_i

    if @image.crop_x.present?
      @image.file.recreate_versions! 
    end
    
    redirect_to @submission, notice: 'Submission with image successfully created.'
  end
  
end

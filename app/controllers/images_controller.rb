class ImagesController < ApplicationController
  
  # PUT /images
  def update
    @submission = Submission.find(params[:image][:imageable_id])
    @image = @submission.image 
    
    @image.crop_x = params[:image][:crop_x]
    @image.crop_y = params[:image][:crop_y]
    @image.crop_w = params[:image][:crop_w]
    @image.crop_h = params[:image][:crop_h]

    if @image.crop_x.present?
      @image.file.recreate_versions! 
    end

    #@image.save
    
    redirect_to @submission, notice: 'Submission with image successfully created.'
  end
  
end

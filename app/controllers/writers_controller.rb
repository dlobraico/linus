class WritersController < ApplicationController
  # GET /writers
  # GET /writers.json
  def index
    @writers = Writer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @writers }
    end
  end

  # GET /writers/1
  # GET /writers/1.json
  def show
    @writer = Writer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @writer }
    end
  end

  # GET /writers/new
  # GET /writers/new.json
  def new
    @writer = Writer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @writer }
    end
  end

  # GET /writers/1/edit
  def edit
    @writer = Writer.find(params[:id])
  end

  # POST /writers
  # POST /writers.json
  def create
    @writer = Writer.new(params[:writer])

    respond_to do |format|
      if @writer.save
        format.html { redirect_to @writer, notice: 'Writer was successfully created.' }
        format.json { render json: @writer, status: :created, location: @writer }
      else
        format.html { render action: "new" }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /writers/1
  # PUT /writers/1.json
  def update
    @writer = Writer.find(params[:id])

    respond_to do |format|
      if @writer.update_attributes(params[:writer])
        format.html { redirect_to @writer, notice: 'Writer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @writer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writers/1
  # DELETE /writers/1.json
  def destroy
    @writer = Writer.find(params[:id])
    @writer.destroy

    respond_to do |format|
      format.html { redirect_to writers_url }
      format.json { head :no_content }
    end
  end
end

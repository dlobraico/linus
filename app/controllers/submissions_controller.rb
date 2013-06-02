class SubmissionsController < ApplicationController
  before_filter :authenticate_editor!
  load_and_authorize_resource

  def current_user
    current_editor
  end

  # GET /submissions
  # GET /submissions.json
  def index
    i = params[:issue_id]
    @issue = Issue.choose_issue(i)
    @submissions = Submission.where("issue_id = ?", @issue)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:  @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    @submission = Submission.new

    unless params["assignment_id"].nil?
      assignment = Assignment.find(params["assignment_id"])
      @submission.headline = assignment.idea.headline
      @submission.writer = Writer.find(assignment.writer)
      @submission.assignment = assignment
      @submission.issue = Issue.choose_issue(nil)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(params[:submission])
    @submission.issue = Issue.choose_issue(nil)
    @image = @submission.image

    if @submission.save
      #if @submission.image.file.present?
      #  render "images/crop"
      #else
        redirect_to @submission, notice: 'Submission was successfully created.'
      #end
    else
      render action: "new"
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])
    @image = @submission.image

    if @submission.update_attributes(params[:submission])
      #if @submission.image.file.present?
      #  render "images/crop"
      #else
        redirect_to @submission, notice: 'Submission was successfully updated.'
      #end
    else
      render action: "edit"
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end

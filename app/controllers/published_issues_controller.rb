class PublishedIssuesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @issues = Issue.where("published = ?", true)

    respond_to do |format|
      format.json { render json: @issues }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @issue = Issue.where("published = ? AND id = ?", true, params[:id])
    
    respond_to do |format|
      format.json { render json:  @issue }
    end
  end

end

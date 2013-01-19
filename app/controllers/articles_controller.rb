class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @issue =
      unless params[:issue_id].nil? 
        issue = Issue.find_by_id(params[:issue_id])
        @articles = Submission.where("issue_id = ? AND published = ?", issue, true)
      else
        @articles = Submission.where("published = ?", true)
      end

    respond_to do |format|
      format.json { render json: @articles.to_json(:include => {:images => {:only => [:description, :file]}}) }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article =
      s = Submission.where("published = ? AND id = ?", true, params[:id])
      if s.published then
        s
      else
        nil
      end

    respond_to do |format|
      format.json { render json:  @article.to_json(:include => {:images => {:only => [:description, :file]}}) }
    end
  end

end

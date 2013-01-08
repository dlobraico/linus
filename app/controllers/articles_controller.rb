class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @issue =
      id = if params[:issue_id].nil? then Issue.last_issue else params[:issue_id] end
      Issue.find_by_id(id)
    @articles = Submission.where("issue_id = ? AND published = ?", @issue, true)

    respond_to do |format|
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article =
      s = Submission.where("published = 1").find(params[:id])
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

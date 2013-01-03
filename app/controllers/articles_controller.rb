class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Submission.where("issue_id = ? AND published = 1", @issue)

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
      format.json { render json: @article }
    end
  end

end

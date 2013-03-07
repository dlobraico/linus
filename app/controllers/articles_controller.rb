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
      format.json { render json: @articles.to_json(:include => {:image => {:only => [:description, :credit, :file]}},
                                                   :only => [:id,
                                                             :headline,
                                                             :byline,
                                                             :clean_body, 
                                                             :created_at, 
                                                             :updated_at, 
                                                             :issue_id]) }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Submission.find_by_id(params[:id])
        
    respond_to do |format|
      if @article.published then
        format.json { render json:  @article.to_json(:include => {:image => {:only => [:description, :credit, :file]}},
                                                     :only => [:id,
                                                               :headline,
                                                               :byline,
                                                               :clean_body, 
                                                               :created_at, 
                                                               :updated_at, 
                                                               :issue_id]) }
      else
        format.json { render json: nil }
      end
    end
  end
end

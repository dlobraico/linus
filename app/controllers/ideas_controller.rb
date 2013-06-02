class IdeasController < ApplicationController
  before_filter :authenticate_editor!
  load_and_authorize_resource

  autocomplete :writer, :name,  :full => true, :extra_data => [:email]
  autocomplete :writer, :email, :full => true, :extra_data => [:name]

  # GET /ideas
  # GET /ideas.json
  def index
    i = params[:issue_id]
    @issue = Issue.choose_issue(i)
    @ideas = Idea.where("issue_id = ?", @issue)

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @ideas }
    end
  end

  def assign
    @idea = Idea.find(params[:id])
    @assignments = @idea.writers.map {|w| w.name}

    respond_to do |format|
      if request.xhr?
        format.html { render layout: 'popup'}
      else
        format.html # assign.html.haml
      end
      format.js
    end
  end

  def update_assignment
    @idea = Idea.find(params[:id])
    hash = { email: params[:idea][:writer][:email],
             name: params[:idea][:writer][:name] }

    @idea.assign! hash
    respond_to do |format|
      if @idea.save and request.xhr?
        format.js
      elsif @idea.save
        format.html { redirect_to ideas_url, notice: 'Idea was successfully updated.' }
        format.json { render json: @idea, status: :assigned, location: @idea }
      else
        format.html { render action: "assign" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea].slice(:headline))
    @idea.issue = Issue.choose_issue(nil)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea].slice(:headline))
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
end

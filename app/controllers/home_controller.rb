class HomeController < ApplicationController
  def index
    @current_issue = Issue.next_issue
    @print_date = "#{@current_issue.printing_deadline.strftime("%A, %B %d at %l:%M %P")}"
    @dist_date = "#{@current_issue.distribution.strftime("%A, %B %d")}"
    @ideas = @current_issue.ideas.size
    @assignments = @current_issue.assignments.size
    @submissions = @current_issue.submissions.size
  end
end

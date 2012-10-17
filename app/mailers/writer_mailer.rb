class WriterMailer < ActionMailer::Base
  default from: "linus@chicagoshadydealer.com"

  def assignment_reminder(writer)
    @writer = writer
    @assignments = writer.assignments
    @current_issue = Issue.next_issue
    mail(:to => writer.email, :subject => "[Chicago Shady Dealer] Assignment Reminder")
  end
end

class WriterMailer < ActionMailer::Base
  default from: "linus@chicagoshadydealer.com"

  def assignment_reminder(writer,assignments)
    @writer = writer
    @assignments = assignments
    @current_issue = Issue.next_issue
    to = "#{writer.name} <#{writer.email}>"
    mail(:to => to, :subject => "[Chicago Shady Dealer] Assignment Reminder")
  end
end

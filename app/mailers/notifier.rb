class Notifier < ActionMailer::Base
  default :from => "dhafer@hylesanderson.edu"

  def work_hours(hours)
    @hours = hours
    mail(:to => "dhafer@hylesanderson.edu", :subject => "Hafer Work Hours")
  end
end
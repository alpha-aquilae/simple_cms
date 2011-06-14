class Notifier < ActionMailer::Base
  default :from => "dhafer@hylesanderson.edu"

  def work_hours(hours)
    @hours = hours
    mail(:to => "tmason@hylesanderson.edu", :bcc => "dhafer@hylesanderson.edu", :subject => "Hafer Work Hours")
  end
end

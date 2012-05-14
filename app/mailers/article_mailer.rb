class ArticleMailer < ActionMailer::Base
  default from: "stefan.haslinger@mittenin.at"

  def submission(article, config, recipient, sender)
    @article = article
    @config = config
    @recipient = recipient
    @sender = sender
    mail(:to => @recipient, :from => @sender, :subject => "Webapplikationsentwicklung durch MITTENIN.AT")
  end
end
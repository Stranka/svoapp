class ArticleMailer < ActionMailer::Base
  default from: "stefan.haslinger@mittenin.at"

  def submission(article, config, recipient)
    @article = article
    @config = config
    @recipient = recipient
    mail(:to => @recipient, :subject => "Webapplikationsentwicklung durch MITTENIN.AT")
  end
end
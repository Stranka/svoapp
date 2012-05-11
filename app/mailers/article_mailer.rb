class ArticleMailer < ActionMailer::Base
  default from: "stefan.haslinger@mittenin.at"

  def submission(article, config)
    @article = article
    @config = config
    mail(:to => "stefan.haslinger@gmail.com", :subject => "Webapplikationsentwicklung durch MITTENIN.AT")
  end
end

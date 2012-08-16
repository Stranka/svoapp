# encoding: utf-8

class ArticleMailer < ActionMailer::Base
  default from: "stefan.haslinger@mittenin.at"

  def submission(article, config, recipient, sender)
    @article = article
    @config = config
    @recipient = recipient
    @sender = sender
    mail(:to => @recipient, :from => @sender, :subject => "Webapplikationsentwicklung durch MITTENIN.AT")
  end

  helper do
    def html_umlaut_remover(string)
      string.gsub!(/ä/,"&auml;")
      string.gsub!(/ö/,"&ouml;")
      string.gsub!(/ü/,"&uuml;")
      string.gsub!(/Ä/,"&Auml;")
      string.gsub!(/Ö/,"&Ouml;")
      string.gsub!(/Ü/,"&Uuml;")
      string.gsub!(/ß/,"&szlig;")
      return string
    end
  end
end
# encoding: utf-8

module ArticlesHelper
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

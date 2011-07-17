class Block < ActiveRecord::Base

  POSITION = ["links", "rechts"];
  validates_presence_of :name, :position, :fieldorder, :blockid

  BLOCKID = ['menue','login', 'productclass', 'news', 'referenzen', 'kundenmeinungen', 'basket', 'search',
             'productsearch',
             'userblock1', 'userblock2', 'userblock3', 'userblock4', 'userblock5', 'userblock6',
             'userblock7', 'userblock8', 'userblock9']

end


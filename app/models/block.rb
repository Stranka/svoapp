class Block < ActiveRecord::Base

  POSITION = ["links", "rechts"];
  validates_presence_of :name, :position, :fieldorder, :blockid

  BLOCKID = ['menue','login', 'productclass', 'news', 'referenzen', 'kundenmeinungen', 'basket', 'search',
             'productsearch', 'customers', 'uptime']
end
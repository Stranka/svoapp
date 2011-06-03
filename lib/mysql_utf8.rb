require 'mysql'

# ==== Synopsis
# This Class modifies overwrites the default Mysql Class. It changes the behaviour, so that each request from the 
# database is returning a UTF-8 encoded answer. 

class Mysql::Result

# ==== Synopsis
# *encode* now forces the encoding to be utf-8 unless stated differently explicitly.
  def encode(value, encoding = "utf-8")
    String === value ? value.force_encoding(encoding) : value
  end
  
# ==== Synopsis  
# *each_utf8* ensured utf8 encoding for each item of a structure.
  def each_utf8(&block)
    each_orig do |row|
      yield row.map {|col| encode(col) }
    end
  end
  alias each_orig each
  alias each each_utf8

# ==== Synopsis
# *each_utf8* ensured utf8 encoding for each item of a hash.
  def each_hash_utf8(&block)
    each_hash_orig do |row|
      row.each {|k, v| row[k] = encode(v) }
      yield(row)
    end
  end
  
  alias each_hash_orig each_hash
  alias each_hash each_hash_utf8
end
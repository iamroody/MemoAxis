require "mongo"

module Database
  def self.feed feed
    db = Mongo::Connection.new.db("test_db")
    feeds = db.collection("feeds")
    feeds.remove
    feeds.insert feed
  end
end

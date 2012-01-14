require "mongo"

module Database
  def self.feed feed
    db = Mongo::Connection.new.db("test_db")
    feeds = db.collection("feeds")
    doc = feed.to_hash
    feeds.insert doc
  end
end

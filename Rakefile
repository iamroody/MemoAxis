require 'cucumber'
require 'cucumber/rake/task'

namespace :test do

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = ["--wip", "features"]
  end

end

namespace :db do
  require "mongo"
  db = Mongo::Connection.new.db("test_db")
  feeds = db.collection("feeds")

  task :load_fixture => :clean do
    doc = [{"type" => "weibo", "content" => "first one"},
           {"type" => "weibo", "content" => "second one"},
           {"type" => "weibo", "content" => "third one"}];
    feeds.insert doc
  end

  task :clean do
    feeds.remove();
  end
end

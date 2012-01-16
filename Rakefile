require 'cucumber'
require 'cucumber/rake/task'

PROJECT_ROOT = File.dirname(__FILE__)

namespace :test do

  desc "run the automatic acceptance tests"
  task :acceptance do
    app_pid = fork {
      start_app
    }
    Rake::Task['test:cucumber'].execute
    Process.kill "HUP", app_pid
  end

  Cucumber::Rake::Task.new(:cucumber) do |t|
    t.cucumber_opts = ["--wip", "features"]
  end

end

def start_app
  Dir.chdir "#{PROJECT_ROOT}/api" do
    exec "node app.js"
  end
end

namespace :api do
  task :install_dependency do
    Dir.chdir "#{PROJECT_ROOT}/api" do
      system "npm install -d"
    end
  end

  desc "start the api local server with fake fixture data"
  task :run => ["db:load_fixture", :install_dependency] do
    start_app
  end
end

namespace :db do
  require "mongo"
  db = Mongo::Connection.new.db("test_db")
  feeds = db.collection("feeds")

  desc "load fixture to database"
  task :load_fixture => :clean do
    doc = [{"type" => "weibo", "content" => "first one"},
           {"type" => "weibo", "content" => "second one"},
           {"type" => "weibo", "content" => "third one"}];
    feeds.insert doc
  end

  desc "clean database"
  task :clean do
    feeds.remove();
  end
end

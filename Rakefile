require 'cucumber'
require 'cucumber/rake/task'

PROJECT_ROOT = File.dirname(__FILE__)

namespace :test do

  desc "run the automatic acceptance tests"
   task :acceptance do
     app_pid = fork {
       start_app
     }
     begin
       Rake::Task['test:cucumber'].execute
     ensure
       Process.kill "HUP", app_pid
     end
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
    doc = [{"type" => "weibo", "content" => "first one", 
            "id" => "1", "title"=>"weibo title1", 
            "key words" =>"key words1"},
           {"type" => "weibo", "content" => "second one",
            "id" => "2", "title"=>"weibo title2", 
            "key words" =>"key words2"},
           {"type" => "weibo", "content" => "third one", 
            "id" => "3", "title"=>"weibo title3", 
            "key words" =>"key words3"}];
    feeds.insert doc
  end

  desc "clean database"
  task :clean do
    feeds.remove();
  end
end

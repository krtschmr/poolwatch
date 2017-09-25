set :bundle_command, "/usr/local/bin/bundle"
env :PATH, ENV['PATH']

job_type :runner,  "cd :path && exec rails runner -e :environment ':task' :output"

every 1.minute do
  runner "Stat.import!"
end

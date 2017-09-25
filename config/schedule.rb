set :bundle_command, "/usr/local/bin/bundle"

every 1.minute do
  runner "Stat.import!"
end

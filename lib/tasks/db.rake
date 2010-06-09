namespace :db do
  desc "set it up"
  task :setup => ['db:drop:all','db:migrate','db:seed']
end
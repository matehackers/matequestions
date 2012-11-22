#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

desc 'Create a new devise admin user.'
task :create_user => :environment do |t, args|

    if ENV['NEW_USER']
        email, password = ENV['NEW_USER'].split(/\s*,\s*/)
        u = User.create :email => email, :password => password

        puts "Created user #{u.email}"
    else
        puts 'Use like "rake create_user NEW_USER=email, password'
    end

end

Questions::Application.load_tasks

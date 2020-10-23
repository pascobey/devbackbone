# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :tmp do
    
    namespace :letter_opener do

        desc "Removes all files and folders in tmp/letter_opener"
        task :empty_mailbox => :environment do
            FileUtils.remove_dir("#{Rails.root}/tmp/letter_opener")
            FileUtils.mkdir("#{Rails.root}/tmp/letter_opener")
        end

    end

end


namespace :test_build do

    desc "Reverts and rebuilds all migrations, seeds database, and emptys letter_opener"
    task :fresh_cucumber  do
        Rake::Task["db:seed"].invoke
        Rake::Task["tmp:letter_opener:empty_mailbox"].invoke
    end

end
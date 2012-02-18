# encoding: utf-8

namespace :view do

  # starten als: 'bundle exec rake view:scaffold'
  # in Produktivumgebungen: 'bundle exec rake view:scaffold RAILS_ENV=production'
  desc "Views regenerieren"
  task :scaffold, [:model]  => :environment do |t, args|
 
    @model = eval args.model
    @definitions = ''
    @model.columns.each do |c|
      unless ["id","updated_at","created_at"].include?(c.name)
        @definitions += c.name + ':' + c.type.to_s + ' '
      end
    end
    @command = "rails generate scaffold_controller " + @model.name.downcase + ' ' + @definitions + '-s '
    puts @command
    exec @command
  end
end

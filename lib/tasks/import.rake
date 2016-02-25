
require 'csv'

namespace :import do

  desc 'An optional description for what the task does'
  task :articles => :environment do
        CSV.foreach("lib/articles.csv", headers: true, encoding: "UTF-8") do |row|
        Article.create!(
          title: row[0], 
          body: row[1], 
        )
      end
  end
end
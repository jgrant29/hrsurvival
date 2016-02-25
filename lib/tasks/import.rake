
require 'csv'

namespace :import do

  desc 'An optional description for what the task does'
  task :articles => :environment do
        CSV.foreach("lib/articles.csv") do |row|
        Article.create!(
          title: row["Title"], 
          body: row["Body"], 
        )
      end
  end

end
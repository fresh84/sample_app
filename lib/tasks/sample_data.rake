require 'faker'

namespace :db do
  desc "Peupler la base de données avec des données fictives"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    administrateur = User.create!(:nom => "Example User",
                         :email => "man@man.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    administrateur.toggle!(:admin)
  end
end

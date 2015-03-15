namespace :patrol do

  desc 'Patrol All'
  task :all => :environment do
    PatrolService.patrol_all
  end

end

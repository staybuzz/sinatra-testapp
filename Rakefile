namespace :db do
  require "sequel"
  Sequel.extension :migration
  DB = Sequel.connect("sqlite://comments.db")

  task :migrate do
    Sequel::Migrator.apply(DB, 'db/migrate')
  end
end

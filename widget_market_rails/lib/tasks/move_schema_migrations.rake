namespace :move_schema_migrations do

  desc "do"
  task :do => :environment do
    cmd = "select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_name = 'rails_schema_migrations'"
    results = ActiveRecord::Base.connection.execute(cmd)
    if results[0].values[0].zero?
      puts "Renaming schema_migrations table to rails_schema_migrations"
      ActiveRecord::Base.connection.execute('ALTER TABLE schema_migrations RENAME TO rails_schema_migrations;')
      puts "Job complete..."
    else
      puts "Warning - rails_schema_migrations already exists. Doing nothing."
    end
  end

  desc "undo"
  task :undo => :environment do
    cmd = "select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_name = 'rails_schema_migrations'"
    results = ActiveRecord::Base.connection.execute(cmd)
    unless results[0].values[0].zero?
      puts "Renaming rails_schema_migrations table to schema_migrations"
      ActiveRecord::Base.connection.execute('ALTER TABLE rails_schema_migrations RENAME TO schema_migrations;')
      puts "Job complete..."
    else
      puts "Warning - rails_schema_migrations does not exist. Doing nothing."
    end
  end
end


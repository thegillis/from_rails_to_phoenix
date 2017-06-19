
cmd = "select count(*) from information_schema.tables where table_type = 'BASE TABLE' and table_name = 'rails_schema_migrations'"
results = ActiveRecord::Base.connection.execute(cmd)
if results[0].values[0].zero?
  puts "********************************************************************"
  puts "***                         WARNING                              ***"
  puts "********************************************************************"
  puts ""
  puts " You probably need to run bin/rails move_schema_migrations:do to"
  puts " change the default migrations table name"
  puts ""
  sleep 1
end

class ActiveRecord::SchemaMigration
  def self.table_name
    "rails_schema_migrations"
  end
end


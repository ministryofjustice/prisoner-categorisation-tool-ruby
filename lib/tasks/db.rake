namespace :db do
  desc 'Delete all tables'
  task clear: :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.tables
    tables.each do |table|
      puts "Deleting #{table}"
      conn.drop_table(table, force: :cascade)
    end
  end

  desc 'Task: clear the database, run migrations and seeds'
  task reseed: [:clear, 'db:migrate', 'db:seed']
end

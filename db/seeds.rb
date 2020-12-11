# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rails db:drop
# rails db:create
# rails db:migrate

ActiveRecord::Base.connection.tables.each do |table|
  # Don't clear our migration history! Clear everything else.
  if table != 'schema_migrations'
      ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table};")
      ActiveRecord::Base.connection.reset_pk_sequence! table
  end
end

meeting_1 = Meeting.create(name: "Planning Poker Meeting")
meeting_2 = Meeting.create(name: "Daily Stand Up")

morpheus = User.create(name: "Morpheus")
neo = User.create(name: "Neo")
trinity = User.create(name: "Trinity")

Record.create(start_date: "00:20:00", end_date: "00:20:10", user_id: morpheus.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:20:11", end_date: "00:20:20", user_id: neo.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:20:21", end_date: "00:20:30", user_id: trinity.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:20:31", end_date: "00:20:40", user_id: morpheus.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:20:45", end_date: "00:20:55", user_id: morpheus.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:21:11", end_date: "00:21:23", user_id: neo.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:22:21", end_date: "00:22:40", user_id: trinity.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:23:31", end_date: "00:23:40", user_id: morpheus.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:23:45", end_date: "00:23:55", user_id: morpheus.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:24:11", end_date: "00:24:20", user_id: neo.id, meeting_id: meeting_1.id)
Record.create(start_date: "00:24:21", end_date: "00:24:30", user_id: trinity.id, meeting_id: meeting_1.id)


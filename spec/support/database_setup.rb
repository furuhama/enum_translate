# frozen_string_literal: true

ActiveRecord::Base.configurations = { "test" => { "adapter" => "sqlite3", "database" => ":memory:" } }
ActiveRecord::Base.establish_connection :test

class CreateAllTables < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :category, null: false, limit: 2

      t.timestamps
    end
  end
end

ActiveRecord::Migration.verbose = false
CreateAllTables.new.change

@migration_class =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  else
    ActiveRecord::Migration
  end

class CreateDistrict < @migration_class
  def change
    create_table :districts do |t|
      t.string :name

      t.timestamps
    end

    add_reference :districts, :regency, foreign_key: true, after: :id
  end
end

class AddOccupations < ActiveRecord::Migration
  def up
    create_table :occupations do |t|
      t.string :first_name
      t.string :biography
      t.string :is_deceased
      t.string :party
      t.string :office
      t.string :occupation
    end
  end

  def down
    drop_table :occupations
  end
end

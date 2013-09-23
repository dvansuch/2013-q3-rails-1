class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :company_name

      t.timestamps
    end
  end
end

class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cell_number

      t.timestamps
    end

    add_column :messages, :contact_id, :integer
  end
end

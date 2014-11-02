class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :friendship
      t.references :user

      t.timestamps
    end
  end
end

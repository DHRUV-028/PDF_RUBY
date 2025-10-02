class CreateInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :infos do |t|
      t.string :orderNo
      t.string :firmName
      t.string :billNo
      t.string :amount
      t.string :location

      t.timestamps
    end
  end
end

class Changecnametomorrow < ActiveRecord::Migration
  def change
    rename_column :lessons, :tommorrow, :tomorrow
  end
end

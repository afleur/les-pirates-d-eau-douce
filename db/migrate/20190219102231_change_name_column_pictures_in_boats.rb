class ChangeNameColumnPicturesInBoats < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :picture, :photo
  end
end

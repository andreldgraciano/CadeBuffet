class RenameMaxPeapleToMaxPeopleInEvents < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :max_peaple, :max_people
  end
end

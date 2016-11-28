class AddZoneIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :zone_id, :integer
  end
end

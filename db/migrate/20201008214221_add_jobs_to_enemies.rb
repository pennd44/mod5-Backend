class AddJobsToEnemies < ActiveRecord::Migration[6.0]
  def change
    add_reference :enemies, :job, null: true, foreign_key: true
  end
end

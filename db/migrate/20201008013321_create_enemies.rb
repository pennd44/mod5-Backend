class CreateEnemies < ActiveRecord::Migration[6.0]
  def change
    create_table :enemies do |t|
      t.string :name
      t.string :avatar
      t.integer :current_health, default: 1
      t.integer :max_health, default: 1
      t.integer :attack, default: 1
      t.integer :defense, default: 1
      t.integer :current_mp, default: 1
      t.integer :max_mp, default: 1
      t.integer :speed, default: 1
      t.integer :charm, default: 1
      t.integer :intelligence, default: 1
      # win/loss effects
      t.integer :win_money, default: 0
      t.integer :loss_money, default: 0
      t.integer :win_xp, default: 0
      t.integer :loss_xp, default: 0
  
     
      

      #references
      # t.references :job, null: true, foreign_key: true

      t.timestamps
    end
  end
end

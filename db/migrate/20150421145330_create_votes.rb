class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :pick
      t.string :from
    end
  end
end

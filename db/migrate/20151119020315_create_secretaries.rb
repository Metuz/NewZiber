class CreateSecretaries < ActiveRecord::Migration
  def change
    create_table :secretaries do |t|


      t.timestamps
    end
  end
end

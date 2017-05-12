class CreateTestresults < ActiveRecord::Migration[5.1]
  def change
    create_table :testresults do |t|
      t.string :test_case_name
      t.string :feature_name
      t.string :test_result
      t.string :environment
      t.string :error_msg
      t.integer :duration

      t.timestamps
    end
  end
end

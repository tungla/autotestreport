class CreateTestresultcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :testresultcomments, id: false do |t|
      t.belongs_to :testresult, index: true
      t.integer :comment_id, primary_key: true	
      t.text :comment
      t.timestamps
    end
  end
end

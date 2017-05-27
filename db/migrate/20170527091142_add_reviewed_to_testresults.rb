class AddReviewedToTestresults < ActiveRecord::Migration[5.1]
  def change
    add_column :testresults, :reviewed, :boolean
  end
end

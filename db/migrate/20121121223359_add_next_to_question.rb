class AddNextToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :next, :integer
  end
end

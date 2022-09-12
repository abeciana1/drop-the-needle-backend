class AddDefaultValueToSubmissionDeadline < ActiveRecord::Migration[6.1]
  def change
    change_column :power_hours, :submission_deadline, :string, :default => ""
  end
end

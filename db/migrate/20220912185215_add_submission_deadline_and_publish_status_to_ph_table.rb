class AddSubmissionDeadlineAndPublishStatusToPhTable < ActiveRecord::Migration[6.1]
  def change
    add_column :power_hours, :submission_deadline, :timestamp, default: ''
    add_column :power_hours, :publish_status, :boolean, default: false
  end
end

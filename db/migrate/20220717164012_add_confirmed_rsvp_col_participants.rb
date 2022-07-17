class AddConfirmedRsvpColParticipants < ActiveRecord::Migration[6.1]
  def change
    add_column :participants, :confirmed_rsvp, :boolean, default: false
  end
end

class AddTeamRefToTeamMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_members, :team, foreign_key: true
  end
end

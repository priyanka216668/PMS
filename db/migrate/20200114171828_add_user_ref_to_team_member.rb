class AddUserRefToTeamMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_members, :user, foreign_key: true
  end
end

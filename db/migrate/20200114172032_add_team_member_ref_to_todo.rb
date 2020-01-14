class AddTeamMemberRefToTodo < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :team_member, foreign_key: true
  end
end

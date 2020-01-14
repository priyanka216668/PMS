class TeamMember < ApplicationRecord
  has_many   :todos
  belongs_to :user
  belongs_to :team
end

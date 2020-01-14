class Team < ApplicationRecord
  has_many :team_members
  belongs_to :project
end

class Project < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :resources
  has_many :users, through: :resources
end

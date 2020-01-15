class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :resources
  has_many :projects, through: :resources
  has_many :managed_projects, class_name: 'Project', foreign_key: 'created_by_id'

  has_many :assigned_todos, class_name: 'Todo', foreign_key: :assigned_to_id
  has_many :managed_todos, class_name: 'Todo', foreign_key: :created_by_id
end

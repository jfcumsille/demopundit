class UserJoinProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :role
end
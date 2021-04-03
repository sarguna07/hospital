class Role < ApplicationRecord
  has_and_belongs_to_many :users

  enum status: {
    inactive: 0,
    active: 1,
  }

  validates :name, presence: true,
                   uniqueness: true

  default_scope { order('name') }

  before_create do |role|
    role.status = 'active'
  end
end

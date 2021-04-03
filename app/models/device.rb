class Device < ApplicationRecord
  belongs_to :user
  validates :mac_address, presence: true,
                          uniqueness: true

  default_scope { order('name') }
  enum status: {
    inactive: 0,
    active: 1
  }

  before_create do
    self.status ||= :active
  end
end

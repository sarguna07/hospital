class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_one :device

  validates :phone, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  enum status: {
    inactive: 0,
    active: 1
  }

  before_validation do |user|
    if password.blank?
      user.password = hexdigest(rand(36**7).to_s(36))
    elsif password?
      user.password = hexdigest(user.password)
    end
  end

  before_create do |user|
    user.status ||= :active
  end

  before_save do |user|
    user.auth_token = hexdigest(password.to_s + full_name.to_s + Time.zone.now.to_s) if user.password.length > 8
  end

  default_scope { order('created_at ASC') }

  def full_name
    [first_name, last_name].join(' ').strip
  end

  def object_json
    as_json(
      except: %i[auth_token password]
    )
  end
end

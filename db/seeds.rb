ActiveRecord::Base.transaction do
  JSON.parse(File.read("#{Rails.root}/app/jsons/data/roles.json")).each do |role|
    Role.create!(role)
  end

  p 'Roles Created!'

  User.create!(
    first_name: 'Admin User',
    email: 'sarguna1744@gmail.com',
    phone: 8_344_254_752,
    password: Digest::MD5.hexdigest('password'),
    country_code: 91
  )

  user = User.create!(
    first_name: 'User',
    email: 'sarguna1771@gmail.com',
    phone: 1_234_567_890,
    password: Digest::MD5.hexdigest('password'),
    country_code: 91
  )

  p 'User Created'

  Device.create!(
    name: 'Register Device',
    mac_address: 'hospital_01',
    user_id: user.id
  )

  p 'Device Created!'

  Role.find_by(name: 'Admin').user_ids = User.where(email: ['sarguna1744@gmail.com']).ids
  Role.find_by(name: 'User').user_ids = User.where(email: ['sarguna1771@gmail.com']).ids

  p 'Now Sarguna is Admin and Sarguna_k is User'
end

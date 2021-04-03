class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.hexdigest(text)
    Digest::MD5.hexdigest(text)
  end

  def hexdigest(text)
    Digest::MD5.hexdigest(text)
  end
end

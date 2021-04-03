module ApplicationHelper
  def hexdigest(text)
    Digest::MD5.hexdigest(text)
  end
end

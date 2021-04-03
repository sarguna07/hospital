# frozen_string_literal: true

class Ambient # :nodoc:
  def self.init
    Thread.current[:config] = {}
  end

  def self.method_missing(name, *args)
    name_as_string = name.to_s
    if name_as_string.ends_with?('=')
      value = args.first
      set(name_as_string.chomp('=').to_sym, value)
    elsif !name_as_string.blank?
      get(name)
    else
      super
    end
  end

  def self.respond_to_missing?(method_name, include_private = false)
    super
  end

  def self.set(key, value)
    Thread.current[:config][key] = value
  end

  def self.get(key)
    Thread.current[:config][key] if Thread.current[:config]
  end
end

module Config
  class AppEnv
    def initialize
      @default_mailer_from = ENV.fetch('MAILER_FROM', 'abc@hospital.com')
      @mailer_auth_key = ENV.fetch('MAILER_AUTH_KEY', '')
    end

    attr_reader :default_mailer_from, :mailer_auth_key
  end

  def self.environment
    @environment ||= AppEnv.new
  end
end

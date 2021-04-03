class WebMailer < ApplicationMailer
  default from: Config.environment.default_mailer_from

  def report_email(patient)
    @email = patient.email
    @name = patient.name
    @dob = patient.dob
    @result = patient.result
    @inference = patient.inference
    @mail = mail(
      to: @email,
      subject: 'Welcome to ABC Hospital.Reports regards your test Report.'
    )
  end
end

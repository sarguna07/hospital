class Patient < ApplicationRecord
  validates :email, :dob, :name, :blood_group, presence: true

  default_scope { order('name') }

  enum result: {
    positive: 0,
    negative: 1,
    neutral: 2
  }

  before_create do
    self.result ||= :neutral
  end

  after_commit do |patient|
    unless patient.result.to_s == 'neutral'
      WebMailer.report_email(
        patient
      ).deliver_now
    end
  end

  def self.search_records(params)
    from_time = params[:from_time] || Date.today.beginning_of_week
    to_time = params[:to_time] || Date.today.end_of_week
    result = params[:result] || %w[positive negative neutral]
    Patient.where('created_at BETWEEN ? AND ?', from_time, to_time).where(result: result)
  end
end

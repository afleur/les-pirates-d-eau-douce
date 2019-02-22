class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :boat
  validates :checkindate, :checkoutdate, presence: true
  validate :checkin_date_cannot_be_in_the_past
  validate :checkout_date_cannot_be_in_the_past

  def checkin_date_cannot_be_in_the_past
    if checkindate.present? && checkindate.to_date < Date.today
      errors.add(:checkin_date, "can't be in the past")
    end
  end

  def checkout_date_cannot_be_in_the_past
    if checkoutdate.present? && checkoutdate.to_date < Date.today
      errors.add(:checkout_date, "can't be in the past")
    end
  end
end

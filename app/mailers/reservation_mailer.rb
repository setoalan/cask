class ReservationMailer < ApplicationMailer
  default from: 'do-not-reply@cask.com'

  def reservation_email(reservation)
    @reservation = reservation
    mail(to: Rails.application.secrets.owner_email, from: @reservation.email, subject: 'New Brewery Reservation')
  end
end

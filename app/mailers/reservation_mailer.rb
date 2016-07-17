class ReservationMailer < ApplicationMailer
  default from: 'do-not-reply@cask.com'

  def reservation_email(reservation, is_new)
    @reservation = reservation
    @is_new = is_new
    mail(to: Rails.application.secrets.owner_email,
         from: @reservation.email,
         subject: @is_new ? 'New Brewery Reservation' : 'Updated Brewery Reservation')
  end
end

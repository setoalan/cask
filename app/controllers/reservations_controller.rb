class ReservationsController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_user
  before_action :validate_user
  before_action :set_brewery
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    if params[:brewery_id]
      @reservations = @brewery.reservations.all
    else
      @reservations = @user.reservations.all
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = @brewery.reservations.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = @brewery.reservations.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { notification }
        format.json { render :show, status: :created, location: @reservation }

      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to [@user, @brewery, @reservation], notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @brewery, @reservation], notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def notification
    ReservationMailer.reservation_email(@reservation).deliver_now
    flash[:notice] = 'Reservation was successfully created.'
    redirect_to breweries_path
  end

  private
    def set_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end

    def set_brewery
      if params[:user_id] && params[:brewery_id]
        @brewery = @user.breweries.find(params[:brewery_id])
      elsif params[:brewery_id]
        @brewery = Brewery.find(params[:brewery_id])
      end
    rescue
      redirect_to root_path, alert: 'Brewery not found.'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      if params[:user_id] && params[:brewery_id]
        @reservation = @brewery.reservations.find(params[:id])
      else
        @reservation = @user.reservations.find(params[:id])
      end
    rescue
      redirect_to root_path, alert: 'Reservation not found.'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:email, :request_date_time, :message, :user_id, :brewery_id)
    end
end

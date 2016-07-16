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
    @reservations = @brewery.reservations.all
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
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [@user, @brewery, @reservation], notice: 'Reservation was successfully created.' }
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

  private
    def set_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end

    def set_brewery
      if params[:user_id]
        @brewery = @user.breweries.find(params[:brewery_id])
      else
        @brewery = Brewery.find(params[:brewery_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:email, :request_date_time, :message, :user_id, :brewery_id)
    end
end

class BreweriesController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  before_action :set_user
  before_action :validate_user
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  # GET /breweries
  # GET /breweries.json
  def index
    if @user
      @breweries = @user.breweries.all
    else
      @breweries = Brewery.all
    end
  end

  # GET /breweries/1
  # GET /breweries/1.json
  def show
  end

  # GET /breweries/new
  def new
    @brewery = @user.breweries.new
  end

  # GET /breweries/1/edit
  def edit
  end

  # POST /breweries
  # POST /breweries.json
  def create
    @brewery = @user.breweries.new(brewery_params)

    respond_to do |format|
      if @brewery.save
        format.html { redirect_to user_breweries_path(@user), notice: 'Brewery was successfully created.' }
        format.json { render :show, status: :created, location: @brewery }
      else
        format.html { render :new }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breweries/1
  # PATCH/PUT /breweries/1.json
  def update
    respond_to do |format|
      if @brewery.update(brewery_params)
        format.html { redirect_to user_brewery_path(@user, @brewery), notice: 'Brewery was successfully updated.' }
        format.json { render :show, status: :ok, location: @brewery }
      else
        format.html { render :edit }
        format.json { render json: @brewery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breweries/1
  # DELETE /breweries/1.json
  def destroy
    @brewery.destroy
    respond_to do |format|
      format.html { redirect_to user_breweries_path(@user), notice: 'Brewery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def star
    brewery = Brewery.find(params[:brewery_id])
    type = params[:type]
    if type == "favorite"
      current_user.starred_restaurants << brewery
      redirect_to :back, notice: 'You favorited ' + brewery.brewery_name
    else
      current_user.starred_restaurants.delete(brewery)
      redirect_to :back, notice: 'Unfavorited ' + brewery.brewery_name
    end
  end

  private
    def set_user
      if params[:user_id]
        @user = User.find(params[:user_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      if @user
        @brewery = @user.breweries.find(params[:id])
      else
        @brewery = Brewery.find(params[:id])
      end
    rescue
      redirect_to root_path, alert: 'Brewery not found.'
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:brewery_name, :brewery_country, :brewery_location, :beer_count, :user_id, category_ids:[])
    end
end

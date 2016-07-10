class BreweriesController < ApplicationController
  before_action :check_signed_in
  before_action :check_current_user
  before_action :set_user
  before_action :set_brewery, only: [:show, :edit, :update, :destroy]

  # GET /breweries
  # GET /breweries.json
  def index
    @breweries = @user.breweries.all
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
        format.html { redirect_to [@user, @brewery], notice: 'Brewery was successfully created.' }
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
        format.html { redirect_to [@user, @brewery], notice: 'Brewery was successfully updated.' }
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
      format.html { redirect_to [@user, @brewery], notice: 'Brewery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_current_user
      if current_user.id.to_s != params[:user_id]
        redirect_to root_path, notice: 'Unauthorized.'
      end
    end

    def check_signed_in
      unless user_signed_in?
        redirect_to new_user_session_path , notice: "Please sign in."
      end
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = @user.breweries.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:brewery_name, :brewery_country, :brewery_location, :beer_count, :user_id)
    end
end

class BeersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :validate_user
  before_action :set_brewery
  before_action :set_beer, only: [:show, :edit, :update, :destroy]

  # GET /beers
  # GET /beers.json
  def index
    @beers = @brewery.beers.all
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
  end

  # GET /beers/new
  def new
    @beer = @brewery.beers.new
  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = @brewery.beers.build(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to [@user, @brewery, @beer], notice: 'Beer was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to [@user, @brewery, @beer], notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to [@user, @brewery, @beer], notice: 'Beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def validate_user
      if @user != current_user && current_user.role != 'admin'
        redirect_to root_path, alert: 'Access denied.'
      end
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_brewery
      @brewery = @user.breweries.find(params[:brewery_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = @brewery.beers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:beer_name, :beer_abv, :beer_ibu, :beer_description, :beer_style, :brewery_id)
    end
end

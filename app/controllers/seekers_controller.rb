class SeekersController < ApplicationController
  before_action :set_seeker, only: %i[ show edit update destroy ]

  # GET /seekers
  def index
    @seekers = Seeker.all
    # The `geocoded` scope filters only seekers with coordinates
    @markers = @seekers.geocoded.map do |seeker| {
      lat: seeker.latitude,
      lng: seeker.longitude
    }
  end
  end

  # GET /seekers/1
  def show
  end

  # GET /seekers/new
  def new
    @seeker = Seeker.new
  end

  # GET /seekers/1/edit
  def edit
  end

  # POST /seekers
  def create
    @seeker = Seeker.new(seeker_params)

    if @seeker.save
      redirect_to @seeker, notice: "Seeker was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seekers/1
  def update
    if @seeker.update(seeker_params)
      redirect_to @seeker, notice: "Seeker was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /seekers/1
  def destroy
    @seeker.destroy
    redirect_to seekers_url, notice: "Seeker was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seeker
      @seeker = Seeker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def seeker_params
      params.require(:seeker).permit(:username, :latitude, :longitude, :status)
    end
end

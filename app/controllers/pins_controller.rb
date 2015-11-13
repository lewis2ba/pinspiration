class PinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def new
    authenticate_user!
    @pin = Pin.new
  end

  def show
    @pin = Pin.find( params[:id] )
  end

  def create
    @pin = current_user.pins.create!(pin_params)
    redirect_to pin_path(@pin)
  end

  def edit
    authenticate_user!
    @pin = Pin.find( params[:id] )
  end

  def update
    @pin = Pin.find( params[:id] )
    @pin.update!(pin_params)
    redirect_to pin_path(@pin)
  end

  def destroy
    Pin.find(params[:id]).destroy
    redirect_to pins_path
  end

  private

  def pin_params
      params.require(:pin).permit(:title, :image_url)
    end

end

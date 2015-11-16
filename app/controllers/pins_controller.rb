class PinsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @pins = Pin.all
    @tag = Tag.new
  end

  def new
    authenticate_user!
    @pin = Pin.new
    @board = Board.find(params[:board_id])
  end

  def show
    @pin = Pin.find( params[:id] )
  end

  def create
    @board = Board.find( params[:board_id] )
    @pin = @board.pins.create(pin_params)
    redirect_to board_path(@board)
  end

  def edit
    authenticate_user!
    @pin = Pin.find( params[:id] )
    @board = Board.find( params[:board_id])
  end

  def update
    @pin = Pin.find( params[:id] )
    @pin.update!(pin_params)
    redirect_to board_path(params[:board_id])
  end

  def destroy
    Pin.find(params[:id]).destroy
    redirect_to board_path(params[:board_id])
  end

  private

  def pin_params
      params.require(:pin).permit(:title, :image_url)
  end

end

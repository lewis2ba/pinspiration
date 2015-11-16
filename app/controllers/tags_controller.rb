class TagsController < ApplicationController

  def new
    @pin = Pin.find(params[:pin_id])
    @tag = Tag.new
  end

  def create
    @pin = Pin.find(params[:pin_id])
    @tag = Tag.create(tag_params)
    @tagging = Tagging.create(pin_id: @pin.id, tag_id: @tag.id)
    redirect_to pin_path(@pin)
  end

  private
  def tag_params
      params.require(:tag).permit(:name)
  end


end

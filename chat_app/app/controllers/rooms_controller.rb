class RoomsController < ApplicationController
  def list
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @room = Room.find_by(params[:id])
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_list_path
    else
      redirect_to root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end

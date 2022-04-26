class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to  '/login'  unless @current_user
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def show
    @current_user = current_user
    @current_room = Room.find(params[:id])
    @id = params[:id]
    @rooms = Room.all
    @message = Message.new
    @messages = @current_room.messages
    render "index"
    
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_index_path
    else
      redirect_to root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end

class RoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to  '/login'  unless @current_user
    @rooms = Room.all.sort_by(&:updated_at).reverse
  end

  def new
    @room = Room.new
  end

  def show
    if session[:current_room] != params[:id]
      session[:current_room] = params[:id]
      session[:page] = 1
    end
    @current_user = current_user
    @current_room = Room.find(params[:id])
    @id = params[:id]
    @rooms = Room.all.sort_by(&:updated_at).reverse
    @message = Message.new
    @messages = @current_room.messages.last(50 * session[:page])
    render "index"
  end

  def incpage
    session[:page] += 1
    puts session[:page]
    redirect_back_or_to({ action: "show", id: session[:current_room] })
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

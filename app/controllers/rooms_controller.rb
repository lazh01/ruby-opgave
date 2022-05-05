class RoomsController < ApplicationController
  #shows a list of rooms with the newest updated at the top, if not logged in redirects to login screen.
  def index
    @current_user = current_user
    redirect_to  '/login'  unless @current_user
    @rooms = Room.all.sort_by(&:updated_at).reverse
  end

  def new
    @room = Room.new
  end

  #displays a chatroom. Has a counter for how many 50 message pages to load, which is incremented by a press of a button.
  #the newest message is at the bottom
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

  #increases the amount of messages to request
  def incpage
    session[:page] += 1
    puts session[:page]
    redirect_back_or_to({ action: "show", id: session[:current_room] })
  end

  #creates a new room from a name
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

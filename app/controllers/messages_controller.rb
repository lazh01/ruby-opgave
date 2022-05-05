class MessagesController < ApplicationController
    #creates a message from user, containing room id and message content. Also touches the room, to update updated_at.
    def create
        @current_user = current_user
        @message = @current_user.messages.create(content: msg_params[:content], room_id: params[:room_id] )
        @room = Room.find(params[:room_id])
        puts @room.touch
    end

    private

    def msg_params
        params.require(:message).permit(:content)
    end
end
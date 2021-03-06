class TrainerChatsController < ApplicationController


  def index
    @rooms = ChatRoom.where(trainer_id: current_trainer.id).order("id DESC").page(params[:page]).per(8)
    @trainer = current_trainer
    @chats = Chat.where(room_id: params[:id])
  end

  def show
    @trainer = current_trainer
    @user = current_user
    @room = Room.find(params[:id])
    @chats = Chat.where(room_id: params[:id])
    @chat = Chat.new(room_id: params[:id], user_id: @room.user.id)
  end

  def create
    Chat.create(chat_params)
    redirect_to request.referer
  end


  private

  def chat_params
    params.require(:chat).permit(:user_id, :message, :room_id).merge(trainer_id: current_trainer.id, is_trainer: true)
  end
end

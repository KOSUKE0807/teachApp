class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    @student = Student.find(@message.student.id)
    if @message.save
      redirect_to student_path(@student.id)
    else
      redirect_to :new
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:title, :detail, :date, :student_id)
  end
end

class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting =  Meeting.find_by(id: params[:id])
    if @meeting.nil?
      redirect_to meetings_path, notice: "Meeting Not Found"
    else
      @meeting_records = @meeting.format_data
    end
  end
end

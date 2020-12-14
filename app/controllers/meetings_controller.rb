# frozen_string_literal: true

# Meetings Controller
class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
    render status: 404 if @meetings.nil?
  end

  def show
    @meeting = Meeting.find_by(id: params[:id])
    if @meeting.nil?
      redirect_to meetings_path, notice: 'Meeting Not Found'
    else
      @meeting_records = @meeting.format_data
    end
  end
end

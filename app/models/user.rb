# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  has_many :records
  has_many :meetings, -> { distinct }, through: :records

  def find_records_by_user
    records
  end

  def find_records_by_meeting(meeting)
    find_records(meeting)
  end

  def number_of_participations_by_meeting(meeting)
    find_records(meeting).count
  end

  def avg_speak_time(meeting)
    user_records = find_records(meeting)

    time_arr = user_records.map do |record|
      record.end_date - record.start_date
    end
    avg_time(time_arr)
  end

  def total_speak_time(meeting)
    user_records = find_records(meeting)

    time_arr = user_records.map do |record|
      record.end_date - record.start_date
    end
    total_time(time_arr)
  end

  private

  def avg_time(arr)
    avg_time_in_seconds = arr.inject(&:+) / arr.length.to_f
    convert_seconds_to_time(avg_time_in_seconds)
  end

  def total_time(arr)
    total_time_in_seconds = arr.inject(&:+)
    convert_seconds_to_time(total_time_in_seconds)
  end

  def convert_seconds_to_time(seconds)
    Time.at(seconds).utc.strftime('%H:%M:%S')
  end

  def find_records(meeting)
    records.where(meeting: meeting)
  end
end

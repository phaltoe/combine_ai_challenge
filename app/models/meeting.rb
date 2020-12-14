# frozen_string_literal: true

# Meeting Model
class Meeting < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, -> { distinct }, through: :records, dependent: :destroy

  def contributions_by_number_of_participations
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.number_of_participations_by_meeting(self)
    end
    contributions.sort_by { |_name, participations| -participations }
  end

  def contributions_by_avg_speak_time
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.avg_speak_time(self)
    end
    contributions.sort_by { |_name, participations| -participations }
  end

  def contributions_by_total_speak_time
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.total_speak_time(self)
    end
    contributions.sort_by { |_name, participations| participations }.reverse
  end

  def format_data
    recs = []
    records.each do |record|
      st = parse_time(record.start_date)
      et = parse_time(record.end_date)
      user = User.find_by_id(record.user_id).name

      recs << [user, et, st]
    end
    recs
  end

  private

  def parse_time(time)
    time.utc.strftime('%H:%M:%S')
  end
end

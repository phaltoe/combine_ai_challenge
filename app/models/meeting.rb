class Meeting < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, -> { distinct }, through: :records, dependent: :destroy

  def contributions_by_number_of_participations
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.number_of_participations_by_meeting(self)
    end
    contributions.sort_by {|name, participations| -participations}
  end

  def contributions_by_avg_speak_time
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.avg_speak_time(self)
    end
    contributions.sort_by {|name, participations| -participations}
  end

  def contributions_by_total_speak_time
    contributions = {}
    users.each do |user|
      contributions[user.name] = user.total_speak_time(self)
    end
    contributions.sort_by {|name, participations| participations}.reverse
  end
end

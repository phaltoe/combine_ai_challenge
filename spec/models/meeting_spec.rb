# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Meeting, type: :model do
  let(:user) { create(:user) }
  let(:meeting) { create(:meeting) }

  it { is_expected.to have_many :users }
  it { is_expected.to have_many :records }

  describe '#contributions_by_number_of_participations' do
    it 'returns all the participations associated with the user' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      response = user.name, user.number_of_participations_by_meeting(meeting)
      expect(meeting.contributions_by_number_of_participations).to eq([response])
    end
  end

  describe '#contributions_by_avg_speak_time' do
    it 'returns all the records avg speak time associated with the user' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      response = user.name, user.avg_speak_time(meeting)
      expect(meeting.contributions_by_avg_speak_time).to eq([response])
    end
  end

  describe '#contributions_by_total_speak_time' do
    it 'returns all the records total speak time associated with the user' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      response = user.name, user.total_speak_time(meeting)
      expect(meeting.contributions_by_total_speak_time).to eq([response])
    end
  end

  describe '#format_data' do
    it 'format the data' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      et = user.records[0].start_date.strftime('%H:%M:%S')
      st = user.records[0].end_date.strftime('%H:%M:%S')
      response = [user.name, st, et]
      expect(meeting.format_data).to eq([response])
    end
  end
end

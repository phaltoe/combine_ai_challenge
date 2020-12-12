# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:meeting) { create(:meeting) }

  it { is_expected.to have_many :meetings }
  it { is_expected.to have_many :records }

  describe '#find_records_by_meeting(meeting)' do
    it 'returns all the records associated with the user' do
      expect(user.find_records_by_meeting(meeting)).to eq(user.records)
    end
  end

  describe '#find_records_by_user' do
    it 'returns all the records associated with the user on a given meeting' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      expect(user.find_records_by_user.length).to eq(2)
    end
  end

  describe 'number_of_participations_by_meeting(meeting)' do
    it 'the amount of participations in a given meeting' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      expect(user.number_of_participations_by_meeting(meeting)).to eq(1)
    end
  end

  describe '#avg_speak_time(meeting)' do
    it 'shows the avg speak time for each user by meeting' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      expect(user.avg_speak_time(meeting)).to eq('00:02:10')
    end
  end

  describe '#total_speak_time(meeting)' do
    it 'shows the total speak time for each user by meeting' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:15:20', end_date: '03:19:30', user_id: user.id,
                      meeting_id: meeting.id)
      expect(user.total_speak_time(meeting)).to eq('00:06:20')
    end
  end
end

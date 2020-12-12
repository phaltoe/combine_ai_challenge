# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  let(:user) { create(:user) }
  let(:meeting) { create(:meeting) }

  it { is_expected.to belong_to :meeting }
  it { is_expected.to belong_to :user }

  describe '#sort_by_user_id' do
    it 'returns all the records associated with the user on a given meeting' do
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      create(:record, start_date: '03:10:20', end_date: '03:12:30', user_id: user.id,
                      meeting_id: meeting.id)
      expect(described_class.sort_by_user_id.length).to eq(2)
    end
  end
end

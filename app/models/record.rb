# frozen_string_literal: true

# Record Model
class Record < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  def self.sort_by_user_id
    order(user_id: :asc)
  end
end

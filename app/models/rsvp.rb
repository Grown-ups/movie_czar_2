# == Schema Information
#
# Table name: rsvps
#
#  id         :integer          not null, primary key
#  accepted   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
class Rsvp < ApplicationRecord
    validate :unique_combination

    def unique_combination
     Rsvp.exists?(
        :event_id => self.event_id,
        :user_id => self.user_id
      )
    end
end

class WidgetDatum < ApplicationRecord
  scope :user_widgets, -> (user) { where(user_id: user.id) }
end

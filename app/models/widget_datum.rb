class WidgetDatum < ApplicationRecord
  scope :user_widgets, -> (user) { where(user: user) }
  belongs_to :widget
  belongs_to :user
end

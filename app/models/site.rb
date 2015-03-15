class Site < ActiveRecord::Base

  has_many :results, dependent: :destroy

  validates :url, presence: true, length: {maximum: 1000}
end

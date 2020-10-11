class Election < ApplicationRecord
  has_many :questions
  has_many :audit_events, dependent: :destroy
  belongs_to :user

  serialize :settings, Hash

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end
end

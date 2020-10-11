class Voter < ApplicationRecord
  belongs_to :election

  before_save :log_self_changed

  def log_self_changed
    election.log_changed("voters", self)
  end
end

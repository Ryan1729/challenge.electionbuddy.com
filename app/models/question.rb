class Question < ApplicationRecord
  belongs_to :election
  has_many :answers

  before_save :log_self_changed

  def log_self_changed
    election.log_changed("questions", self)
  end
end

class Answer < ApplicationRecord
  belongs_to :question

  before_save :log_self_changed

  def log_self_changed
    question.election.log_changed("answers", self)
  end
end

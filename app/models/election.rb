class Election < ApplicationRecord
  has_many :questions
  has_many :audit_events, dependent: :destroy
  belongs_to :user
  before_save :log_changed

  serialize :settings, Hash

  def log_changed
    if self.changed?
      self.changed.each do |attr|
        audit_events.create(
          :user_id=>user.id,
          :column_name=>attr.to_s,
          :table_name=>"elections",
          :old_value=>self.attributes[attr],
          :new_value=>self.changed_attributes[attr]
        )
      end
    end
  end

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    settings[:visibility] = value
  end
end

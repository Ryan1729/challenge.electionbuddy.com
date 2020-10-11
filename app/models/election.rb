class Election < ApplicationRecord
  has_many :questions
  has_many :audit_events, dependent: :destroy
  belongs_to :user
  before_save :log_self_changed

  serialize :settings, Hash

  def log_self_changed
    log_changed("elections", self)
  end

  def log_changed(table_name, record)
    if record.changed?
      record.changed.each do |attr|
        audit_events.create(
          :user_id=>user.id,
          :column_name=>attr.to_s,
          :table_name=>table_name,
          :old_value=>record.changed_attributes[attr],
          :new_value=>record.attributes[attr]
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

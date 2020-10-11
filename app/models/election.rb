class Election < ApplicationRecord
  has_many :questions
  has_many :audit_events, dependent: :destroy
  belongs_to :user

  serialize :settings, Hash

  def visibility
    settings[:visibility]
  end

  def visibility=(value)
    audit_events.create(
      :user_id=>user_id,
      :column_name=>"settings.visibility",
      :table_name=>"elections",
      :old_value=>visibility,
      :new_value=>value
    )
  
    settings[:visibility] = value
  end
end

class Code < ActiveRecord::Base
  hobo_model # Don't put anything above this
  #TargetType = HoboFields::Types::EnumString.for(:food, :offer)

  fields do
    codepoint  :string
    type       :string
    timestamps
  end

  belongs_to  :dish
  belongs_to  :offer

  def type
    @type || 'food'
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end

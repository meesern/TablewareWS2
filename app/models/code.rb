class Code < ActiveRecord::Base
  hobo_model # Don't put anything above this
  #TargetType = HoboFields::Types::EnumString.for(:food, :offer)

  fields do
    codepoint  :string
    timestamps
  end

  belongs_to  :dish
  belongs_to  :offer

  def type
    #It's an offer if offer is defined, else its a food
    (offer)? 'offer' : 'food'
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

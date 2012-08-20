class Party < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name   :text
    table  :integer
    seated :datetime
    left   :datetime
    timestamps
  end

  has_many :customers
  children :customers

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
    acting_user.administrator?
  end

end

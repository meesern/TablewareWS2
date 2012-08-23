class Customer < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    uname      :string
    known_name :string
    timestamps
  end
  
  belongs_to :party
  has_many   :communiques

  def name
    "#{uname}: #{known_name}"
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
    acting_user.administrator?
  end

end

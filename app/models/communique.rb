class Communique < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    message    :text
    timestamps
  end
  
  belongs_to :customer

  def name
    message
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

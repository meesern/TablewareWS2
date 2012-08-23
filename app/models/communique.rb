class Communique < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    message    :string
    ack        :boolean
    timestamps
  end
  
  belongs_to :customer

  def name
    message
  end

  def acknowledge
    self.ack=true
    save!
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

  def acknowledge_permitted?
    acting_user.administrator?
  end
end

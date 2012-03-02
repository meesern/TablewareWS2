class Encounter < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    comment :string
    rating  :integer
    timestamps
  end

  belongs_to :user
  belongs_to :dish

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

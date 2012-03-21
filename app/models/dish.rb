class Dish < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name  :string
    thumb :string
    image :string
    title :string
    url1  :string
    url2  :string
    url3  :string
    timestamps
  end

  has_one :code

  mount_uploader :image, ImageUploader

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

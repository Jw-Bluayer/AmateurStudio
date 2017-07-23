class AddS3ToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :image, :string
  end
end

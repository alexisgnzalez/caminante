class AddCoordinatesToTours < ActiveRecord::Migration[6.0]
  def change
    if !ActiveRecord::Base.connection.column_exists?(:tours, :long)
      add_column :tours, :long, :float
    end

    if !ActiveRecord::Base.connection.column_exists?(:tours, :lat)
      add_column :tours, :lat, :float
    end
  end
end

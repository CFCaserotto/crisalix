class ChangeDefaultUserRoleToPatient < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :role, 'patient'
  end

  def down
    change_column_default :users, :role, nil
  end
end

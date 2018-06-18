class ChangeBodyDefaultValueInSignUps < ActiveRecord::Migration[5.0]
  def change
    change_column_default :sign_ups, :body, 'My thoughts...'
  end
end

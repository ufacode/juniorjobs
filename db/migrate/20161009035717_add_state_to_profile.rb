class AddStateToProfile < ActiveRecord::Migration[5.0]
  def self.up
    add_column :profiles, :aasm_state, :string
  end

   def self.down
     remove_column :profiles, :aasm_state
   end
end

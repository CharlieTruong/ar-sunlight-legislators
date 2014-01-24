require_relative '../config'


class ModifyColumnname < ActiveRecord::Migration
  def change
    rename_column :congress_members, :party_id, :political_party_id    
  end
end


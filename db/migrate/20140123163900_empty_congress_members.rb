require 'csv'
require_relative '../config'


class EmptyCongressMembers < ActiveRecord::Migration
  def change

    drop_table :congress_members

    create_table :congress_members do |t|
      t.string    :name
      t.string    :phone
      t.string    :fax
      t.string    :website
      t.string    :webform
      t.string    :gender
      t.date      :birthdate
      t.string    :twitter_id
      t.string    :title
      t.integer   :party_id
      t.integer   :state_id
      t.belongs_to :political_party
      t.belongs_to :state
      t.timestamps
    end
  end
end


# encoding: utf-8

require 'sequel'

Sequel.migration do
  transaction
  change do
    create_table(:tags) do
      primary_key :id
      String :name,         :null=>false, :unique=>true
      Integer :quantity
    end
  end
end

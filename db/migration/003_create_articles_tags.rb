# encoding: utf-8

require 'sequel'

Sequel.migration do
  transaction
  change do
    create_table(:articles_tags) do
      foreign_key :article_id
      foreign_key :tag_id
    end
  end
end

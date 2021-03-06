#!ruby -w
# encoding: utf-8

require 'yaml'

username = ENV['USER']  #linux/unix only, use "ENV['USERNAME']" on windows
if File.exist?("config/config_#{username}.yaml")
  config = YAML.load_file "config/config_#{username}.yaml"
else
  config = YAML.load_file "config/config.yaml"
end

adapter = config["database"]["adapter"]
database = config["database"]["database"]
user = config["database"]["user"]
host = config["database"]["host"]
passwd = config["database"]["passwd"]

sequel_command = "sequel -m db/migration sqlite://db/#{database}.db"
sequel_command = "sequel -m db/migration #{adapter}://#{user}:#{passwd}@#{host}/#{database}" if adapter == "mysql2"
puts sequel_command
system sequel_command
puts "Sqlite database file: db/#{database}.db" if adapter == "sqlite3"

module Boketto
  CONFIG_PATH = Rails.root.join('config', 'boketto.yml')
  CONFIG = YAML.load(File.read(CONFIG_PATH)) || {}
end

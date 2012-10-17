EXTERNAL_CONFIG = YAML.load_file("#{::Rails.root.to_s}/config/external_config.yml")[::Rails.env]

namespace :boketto do
  desc "Create a config YAML file for boketto"
  task :setup => :environment do
    config_path = Rails.root.join("config", "boketto.yml")

    # appending existing config if there is a config already
    if File.exist?(config_path)
      puts "Appending existing config"
      result = YAML.load(File.read(config_path))
    else
      puts "Creating a new config"
      result = {}
    end

    output_file = File.open(config_path, 'w')

    # get all the models are on your app and feed the config data
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.map(&:name).each do |model_name|
      columns = model_name.constantize.column_names
      if result[model_name] # check if a model is in the config already
        columns.reject! { |c| c.in?(result[model_name].keys) }
        result[model_name].merge!( Hash[ columns.map { |c| [c, ''] } ] ) # then merge them
      else
        result[model_name] = Hash[columns.map { |c| [c, ''] }] # otherwise just populate the hash
      end
    end

    # write all the models and their column names into a YAML file
    output_file << result.to_yaml
    output_file.close
  end
end


module Konpasu
  class HerokableCompass < Rails::Railtie
    initializer 'konpasu.configure_compass_for_tmp_directory' do
      require 'fileutils'
      FileUtils.mkdir_p Rails.root.join 'tmp', 'stylesheets'
      
      Compass.configuration do |config|
        config.project_path     = Rails.root.to_s
        config.sass_dir         = 'app/stylesheets'
        config.css_dir          = 'tmp/stylesheets'
        config.output_style     = Rails.env.production? ? :compressed : :expanded
        config.environment      = Rails.env
        config.relative_assets  = false
      end
      
      Compass.configure_sass_plugin!
    end
    
    initializer 'konpasu.add_sass_logging' do
      Sass::Plugin.on_updating_stylesheet do |template, css|
        puts "Compiling #{template} to #{css}"
      end
    end
    
    initializer 'konpasu.setup_rack_middleware' do
      Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
                                                   :root        => Rails.root.join('tmp'), 
                                                   :urls        => ['/stylesheets'],
                                                   :versioning  => false)
    end
  end
end

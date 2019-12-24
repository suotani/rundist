# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( common.css )
Rails.application.config.assets.precompile += %w( users_new.css )
Rails.application.config.assets.precompile += %w( works_index.css )
Rails.application.config.assets.precompile += %w( modes_index.css )
Rails.application.config.assets.precompile += %w( check_points_index.css )
Rails.application.config.assets.precompile += %w( check_points_new.css )
Rails.application.config.assets.precompile += %w( calenders_index.css )
Rails.application.config.assets.precompile += %w( check_points.js )


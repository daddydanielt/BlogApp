# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(scss|css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

#guard :rspec, cmd: "bundle exec rspec" do
guard :rspec, cmd: "rspec" do


  require "guard/rspec/dsl"
  dsl = Guard::RSpec::Dsl.new(self)

  # Feel free to open issues for suggestions and improvements

  # RSpec files
  rspec = dsl.rspec
  watch(rspec.spec_helper) { rspec.spec_dir }
  watch(rspec.spec_support) { rspec.spec_dir }
  watch(rspec.spec_files)

  # Capybara features specs
  #watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) { |m| "spec/features/#{m[1]}_spec.rb" }
  #watch(%r{^app/views/(.+)/.*\.(erb|haml)$}) { "spec/features/*_spec.rb" }

  # Ruby files
  ruby = dsl.ruby
  dsl.watch_spec_files_for(ruby.lib_files)

  # Rails files
  rails = dsl.rails(view_extensions: %w(erb haml slim))
  dsl.watch_spec_files_for(rails.app_files)
  dsl.watch_spec_files_for(rails.views)

  # [Daniel][start] --->
  # %r{} is equivalent to the /.../ notation, but allows you to have '/' in your regexp without having to escape them:
  # \. => contains a dot
  # $ => the end, nothing after it
  # i => case insensitive
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) {"spec/features"}
  watch(%r{^app/models/(.+)\.rb$}) { "spec/features"}
  # [Daniel][end] --->

  watch(rails.controllers) do |m|
    [
      rspec.spec.("routing/#{m[1]}_routing"),
      rspec.spec.("controllers/#{m[1]}_controller"),
      rspec.spec.("acceptance/#{m[1]}")
    ]
  end

  # Rails config changes
  watch(rails.spec_helper)     { rspec.spec_dir }

  # [Daniel][start] --->
  # [Daniel][mark] watch(rails.routes)          { "#{rspec.spec_dir}/routing" }
  watch(rails.routes)          {  "spec" }
  # [Daniel][end] --->

  watch(rails.app_controller)  { "#{rspec.spec_dir}/controllers" }

  # Capybara features specs

  # [Daniel][start] --->
  # [Daniel][mark] watch(rails.view_dirs) { |m| rspec.spec.("features/#{m[1]}") }
  # [Daniel][mark] watch(rails.layouts)       { |m| rspec.spec.("features/#{m[1]}") }
  watch(rails.view_dirs) {  "spec/features" }
  watch(rails.layouts)   {  "spec/featuresls" }

  # [Daniel][end] --->

  # Turnip features and steps
  # watch(%r{^spec/acceptance/(.+)\.feature$})
  # watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$}) do |m|
  #   Dir[File.join("**/#{m[1]}.feature")][0] || "spec/acceptance"
  # end
end

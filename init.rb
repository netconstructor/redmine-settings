require 'redmine'
require 'dispatcher'

RAILS_DEFAULT_LOGGER.info 'Starting Project Settings Hook Plugin for Redmine'

Dispatcher.to_prepare :project_settings_hook_plugin do
    unless ProjectsHelper.included_modules.include?(SettingsProjectsHelperPatch)
        ProjectsHelper.send(:include, SettingsProjectsHelperPatch)
    end
end

Redmine::Plugin.register :project_settings_hook_plugin do
    name 'Project Settings Hook'
    author 'Andriy Lesyuk'
    author_url 'http://www.andriylesyuk.com'
    description 'Adds a hook allowing to add tabs to project settings.'
    url 'http://projects.andriylesyuk.com/projects/redmine-settings'
    version '0.0.1'
end

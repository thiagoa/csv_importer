require 'rails_helper'
require 'rake'

CsvImporter::Application.load_tasks
Rake::Task['webpack:compile'].invoke

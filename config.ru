require './config/environment'

=begin
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
=end


use Rack::MethodOverride
use AuthorsController
use BooksController
use UsersController
use SubjectsController
run ApplicationController

SimpleCov.start 'rails' do
  enable_coverage :branch
  primary_coverage :branch
  add_group "Components", "app/components"
  add_group "Services", "app/services"
  add_group "Policies", "app/policies"

  add_filter do |source_file|
    source_file.branches.count == 0
  end
end
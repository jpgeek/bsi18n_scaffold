namespace :bsi18n_scaffold do
  desc "Copy scaffold files into lib directory of current application"
  task :copy_templates => :environment do
    from_dir = File.join(File.dirname(__FILE__), '..', 'templates')
    to_dir = File.join(Rails.root, 'lib')
    FileUtils.cp_r(from_dir, to_dir)
  end
end

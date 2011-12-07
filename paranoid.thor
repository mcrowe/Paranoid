class Paranoid < Thor
  
  BACKUP_ROOT = '~/.paranoid'
  
  include Thor::Actions
  
  desc "init", "Initialize a paranoid project. Creates a .backupignore file."
  def init
    say 'Initializing paranoid project.', :yellow
    create_file '.backupignore', <<-EOF
.DS_Store
.git
.bundle
.sass_cache
tmp/    
EOF
  end
  
  desc 'backup', 'Backup the current project.'
  def backup
    say "Backing up to #{backup_path}.", :yellow
  
    # Ensure project is paranoid.
    invoke :init unless File.exists?('.backupignore')

    # Ensure the root backup path exists.
    empty_directory BACKUP_ROOT

    # Copy the files to the backup location recursively using rsync.
    # Ignore the files in .backupignore.
    system %Q(rsync -avz . #{backup_path} --exclude-from .backupignore)    
    
    say 'Done', :yellow
  end
  
  private
  
  def backup_path
    name = destination_root.gsub('/','_')[1..-1]
    timestamp = Time.now.strftime('%Y%m%d%H%M%S')
    
    "#{BACKUP_ROOT}/#{name}_#{timestamp}"
  end
  
end
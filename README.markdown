# Paranoid
## A backup script for when the world's out to get you

When I've put a ton of effort into a personal project, I tend to get paranoid that I'll toast it somehow. I know, I know, git, github, and time machine already have my back. Sometimes that's just not enough, though, and I periodically make manual copies of important projects to a backup directory. Whether its helpful or not, having hard copy snapshots just makes me feel better.

Paranoid is a Thor script for those paranoid coders like me, who are also lazy like me. Sure, you could use a one-liner `cp -rf`, or `rsync` command, but there are a few niceties that paranoid gives you:

* Backups are be timestamped, so they are never written over, and you can easily access the project snapshot at a given time. 

* You can specify files to exclude from a backup on a project-by-project basis by modifying a `.backupignore` file. This allows you to ignore `.git` and `.bundle` directories as well as any project specific files such as large data dumps that you might not want copied over and over. 

### Install paranoid
Paranoid is a Thor script, and you must have [Thor](https://github.com/wycats/thor) install first. To install this script as a system Thor script, clone the repository and run:

    thor install paranoid.thor

### Make your projects paranoid
In your project root directory, run:

    thor paranoid init
This creates a default `.backupignore` file. This file defines patterns for files you don't want to backup in this project. You might want to add any large data files and things like that.

### Backup a paranoid project
In your project root directory, run:
    
    thor paranoid backup
This rsyncs your project to the `~/.paranoid directory`, ignoring any files matching the patterns in the project's `.backupignore` file.


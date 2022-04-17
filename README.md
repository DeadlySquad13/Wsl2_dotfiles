# Table of Contents

- [Table of Contents](#table-of-contents)
- [Wsl2_dotfiles](#wsl2_dotfiles)
  - [Stow utility](#stow-utility)
  - [Restoring backup](#restoring-backup)
  - [References](#references)

# Wsl2_dotfiles
Configuration files of my Windows 10 Subsystem for Linux.

## Stow utility
Stow utility is used. It symlinks files: for each program it\'s own folder.
There the file path to this program configuration should be recreated.
```bash
# Recreate a file structure. ${path_to_program} is a path to the ${program} configuration folder
# relative to ${starting_point} - root of the programs configurations (most often ~):
$ mkdir -p ${STOW_HOME}/${program}/${path_to_program}
$ mv ${starting_point}/${path_to_program}/* ${STOW_HOME}/${program}/${path_to_program}
# Link everything.
$ cd ${STOW_HOME}
$ stow -vt {starting_point} *

# For example (program = smug, path_to_program = .config/smug (relative to starting_point = ~),
# STOW_HOME = var/local/backup/_dotfiles/stow_home):
$ mkdir -p var/local/backup/_dotfiles/stow_home/smug/.config/smug
$ mv ~/.config/smug/ var/local/backup/_dotfiles/stow_home/smug/.config/smug/
$ cd var/local/backup/_dotfiles/stow_home
$ stow -vt ~ *

# Or if you\`re already inside STOW_HOME:
$ mkdir -p ./smug/.config/smug
$ mv ~/.config/smug/ ./smug/.config/smug/
$ stow -vt ~ *

# Should see because of v - verbose option:
LINK: .config/smug => ../../../var/local/Backup/_dotfiles/stow_home/smug/.config/smug
```

## Restoring backup
- `git clone` this repo.
- Go to stow_home and use `stow -vt ~ *`.
- Change permissions of the stow_home recursively (for example, `chmod 777 -R stow_home`).


## References
[Linux backup guide using stow](https://linustechtips.com/topic/1369746-howto-backup-your-configuration-files-dotfiles-in-linux-using-stow-and-git/?__cf_chl_jschl_tk__=pmd_BNJiX2FYMe8YiQvtpFOKs3V55h8G99xvMUZ4sCbE.EI-1635858821-0-gqNtZGzNArujcnBszRal)

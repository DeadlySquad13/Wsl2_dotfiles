# Wsl2_dotfiles
Configuration files of my Windows 10 Subsystem for Linux.

## Stow utility
Stow utility is used. It symlinks files: for each program it\'s own folder.
There the file path to this program configuration should be recreated.
```bash
# Recreate a file structure. ${path_to_program} is a path to the ${program} configuration folder
relative to ${starting_point} - root of the programs configurations (most often ~):
$ mkdir -p ${STOW_HOME}/${program}/${path_to_program}
$ mv ${starting_point}/${path_to_program}/ ${STOW_HOME}/${program}/${path_to_program}/
$ cd ${STOW_HOME}
# Link everything.
$ stow -vt {starting_point} *

# For example (program = smug, path_to_program = .config/smug (relative to starting_point = ~),
STOW_HOME = var/local/backup/_dotfiles/stow_home):
$ mkdir -p var/local/backup/_dotfiles/stow_home/smug/.config/smug
$ mv ~/.config/smug/ var/local/backup/_dotfiles/stow_home/smug/.config/smug/
$ stow -vt ~ *

# Or if you\`re already inside STOW_HOME:
$ mkdir -p ./smug/.config/smug
$ mv ~/.config/smug/ ./smug/.config/smug/
$ stow -vt ~ *

# Should see because of v - verbose option:
LINK: .config/smug => ../../../var/local/Backup/_dotfiles/stow_home/smug/.config/smug
```

import subprocess
import os

from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables


# # Broot integration.
def show_error_in_console(msg, fm):
    fm.notify(msg, bad=True)


def navigate_path(fm, selected):
    if not selected:
        return

    selected = os.path.abspath(selected)
    if os.path.isdir(selected):
        fm.cd(selected)
    elif os.path.isfile(selected):
        fm.select_file(selected)
    else:
        show_error_in_console(f"Neither directory nor file: {selected}", fm)
        return


def run_and_cd(cmd, fm):
    proc = fm.execute_command(cmd, text=False, stdout=subprocess.PIPE)
    stdout, _ = proc.communicate()
    if proc.returncode != 0:
        show_error_in_console(f"Bad process exit code: {proc.returncode}", fm)
        return

    navigate_path(fm, stdout.strip())


class broot_select(Command):  # noqa
    def execute(self):
        if "broot" not in get_executables():
            show_error_in_console("Could not find broot", self.fm)
            return

        run_and_cd("broot", self.fm)


# Copy the content of image file and text file with xclip
from ranger.container.file import File


class YankContent(Command):
    """
    Copy the content of image file and text file with xclip
    """

    def execute(self):
        if 'xclip' not in get_executables():
            self.fm.notify('xclip is not found.', bad=True)
            return

        arg = self.rest(1)
        if arg:
            if not os.path.isfile(arg):
                self.fm.notify('{} is not a file.'.format(arg))
                return
            file = File(arg)
        else:
            file = self.fm.thisfile
            if not file.is_file:
                self.fm.notify('{} is not a file.'.format(file.relative_path))
                return

        relative_path = file.relative_path
        cmd = ['xclip', '-selection', 'clipboard']
        if not file.is_binary():
            with open(file.path, 'rb') as fd:
                subprocess.check_call(cmd, stdin=fd)
        elif file.image:
            cmd += ['-t', file.mimetype, file.path]
            subprocess.check_call(cmd)
            self.fm.notify('Content of {} is copied to x clipboard'.format(relative_path))
        else:
            self.fm.notify('{} is not an image file or a text file.'.format(relative_path))

    def tab(self, tabnum):
        return self._tab_directory_content()

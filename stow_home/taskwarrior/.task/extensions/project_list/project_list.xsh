#!/usr/bin/env xonsh
# PYTHON_ARGCOMPLETE_OK
import json

import argparse
import argcomplete # Tab completion support for xontrib-argcomplete.
from argcomplete.completers import ChoicesCompleter

from flatten import flatten

with open('projects.json') as f:
  projects = json.load(f)

def projects_completer(prefix, parsed_args, **kwargs):
    return flatten(projects)

argp = argparse.ArgumentParser(description='Project name')
argp.add_argument('--pro', required=True, help='Project').completer = projects_completer

argcomplete.autocomplete(argp)
args = argp.parse_args()

print(flatten(projects))


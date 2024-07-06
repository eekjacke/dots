#!/usr/bin/env xonsh

import json
import sys


def check_updates():
    updates = $(checkupdates).split('\n')
    num_updates = len(updates) - 1
    if num_updates > 10:
        updates = updates[:10]
        updates[-1] = '...'
    updates = "\n".join(updates)
    out = {
        "text": str(num_updates),
        "alt": '',
        "tooltip": updates,
        "class": "pacman",
        "percentage": ''
    }
    print(json.dumps(out))
    return json.dumps(out)

def list_updates():
    updates = $(checkupdates)
    updates = updates.split()
    if len(updates) < 1:
        input('All packages are up to date!')
        return
    print($(checkupdates))
    
    print('Update packages?')
    cmd = input('(y/n): ')
    match cmd:
        case 'y':
           sudo pacman -Syu
        case 'n':
            pass
        case _:
            pass

def main():
    if len(sys.argv) < 2:
        check_updates()
    else:
        list_updates()

if __name__ == '__main__':
    main()

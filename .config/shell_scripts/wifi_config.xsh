#!/usr/bin/env xonsh

import getpass

def get_current_ssid():
    out = $(nmcli d wifi).split()
    for i, entry in enumerate(out):
        if entry == '*':
            return out[i+2]
    return 'Not connected'


def disconnect_prompt(ssid):
    print(f'Disconnect from wireless network? {ssid}')
    cmd = input("(y/n)")
    match cmd:
        case "y":
            !(nmcli c d @(ssid))
        case "n":
            pass

def connect_prompt():
    ssid = input('SSID: ')
    pw = getpass.getpass('Password: ')
    nmcli dev wifi connect @(ssid) password @(pw)

nmcli d wifi list
status = get_current_ssid()
if status == "Not connected":
    connect_prompt()
else:
    disconnect_prompt(status)





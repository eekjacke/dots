
#!/usr/bin/env xonsh

import json

# TODO - Add conn info to tooltip, add interactivity enable/disable etc..
def main():
    status = !(systemctl is-active --quiet wg-quick@integrity2-SE.service)
    # if 0 exit code
    if not status.returncode:
        json_string = {
            "text": "active",
            "alt": "active",
            "tooltip": "VPN active \n wg-quick@integrity2-SE.service",
            "class": "active",
            "percentage": ""
        }
    else: 
        json_string = {
            "text": "inactive",
            "alt": "inactive",
            "tooltip": "VPN inactive",
            "class": "inactive",
            "percentage": ""
        }
    print(json.dumps(json_string))
    return json.dumps(json_string)

if __name__ == '__main__':
    main()

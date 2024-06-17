#!/bin/bash

# comments inside each handler list the variables
# that are set when the handler is invoked

WORKSPACE_LOG=/tmp/workspaces.log

event_workspace() {
  : # WORKSPACENAME
  echo $WORKSPACENAME >> /tmp/current_workspace.log
}

event_workspacev2() {
  : # WORKSPACEID WORKSPACENAME
}

event_focusedmon() {
  : # MONNAME WORKSPACENAME
}

event_activewindow() {
  : # WINDOWCLASS WINDOWTITLE
}

event_activewindowv2() {
  : # WINDOWADDRESS
}

event_fullscreen() {
  : # ENTER (0 if leaving fullscreen, 1 if entering)
}

event_monitorremoved() {
  : # MONITORNAME
}

event_monitoradded() {
  : # MONITORNAME
}

event_monitoraddedv2() {
  : # MONITORID MONITORNAME MONITORDESCRIPTION
}

event_createworkspace() {
  : # WORKSPACENAME
  local current_line=$(tail -n 1 "$WORKSPACE_LOG")
  local updated_line=$(echo $current_line | jq ".+= [\"$WORKSPACENAME\"]")
  echo "$updated_line" >> "$WORKSPACE_LOG"
}

event_createworkspacev2() {
  : # WORKSPACEID WORKSPACENAME
}

event_destroyworkspace() {
  : # WORKSPACENAME
}

event_destroyworkspacev2() {
  : # WORKSPACEID WORKSPACENAME
}

event_moveworkspace() {
  : # WORKSPACENAME MONNAME
}

event_moveworkspacev2() {
  : # WORKSPACEID WORKSPACENAME MONNAME
}

event_renameworkspace() {
  : # WORKSPACEID NEWNAME
}

event_activespecial() {
  : # WORKSPACENAME MONNAME
}

event_activelayout() {
  : # KEYBOARDNAME LAYOUTNAME
}

event_openwindow() {
  : # WINDOWADDRESS WORKSPACENAME WINDOWCLASS WINDOWTITLE
}

event_closewindow() {
  : # WINDOWADDRESS
}

event_movewindow() {
  : # WINDOWADDRESS WORKSPACENAME
}

event_movewindowv2() {
  : # WINDOWADDRESS WORKSPACEID WORKSPACENAME
}

event_windowtitle() {
  : # WINDOWADDRESS
}

event_openlayer() {
  : # NAMESPACE
}

event_closelayer() {
  : # NAMESPACE
}

event_submap() {
  : # SUBMAPNAME
}

event_changefloatingmode() {
  : # WINDOWADDRESS FLOATING
}

event_urgent() {
  : # WINDOWADDRESS
}

event_minimize() {
  : # WINDOWADDRESS MINIMIZED
}

event_screencast() {
  : # STATE OWNER
}

event_togglegroup() {
  : # STATE WINDOWADDRESSSES
}

event_moveintogroup() {
  : # WINDOWADDRESS
}

event_moveoutofgroup() {
  : # WINDOWADDRESS
}

event_ignoregrouplock() {
  : # STATE
}

event_lockgroups() {
  : # STATE
}

event_configreloaded() {
  :
}

event_pin() {
  : # WINDOWADDRESS PINSTATE
}

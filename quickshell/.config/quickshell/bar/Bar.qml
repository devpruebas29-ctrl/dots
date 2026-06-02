import QtQuick
import Quickshell
import Quickshell.Wayland
import "Theme.qml" as Theme

PanelWindow {
  anchors { top: true; left: true; right: true }
  height: Theme.barHeight
  color: "transparent"

  Rectangle {
    anchors { fill: parent; topMargin: 4; leftMargin: 6; rightMargin: 6; bottomMargin: 0 }
    color: Theme.bgAlt
    radius: Theme.radius
    opacity: 0.92
  }

  Row {
    anchors { left: parent.left; verticalCenter: parent.verticalCenter; leftMargin: Theme.padding }
    spacing: Theme.spacing
    height: parent.height

    Workspaces {}
  }

  Row {
    anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: Theme.padding }
    spacing: Theme.spacing
    height: parent.height

    Volume {}
    Network {}
    Battery {}
    SystemTray {}
    Clock {}
  }
}

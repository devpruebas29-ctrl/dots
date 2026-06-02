import QtQuick
import Quickshell
import Quickshell.Wayland
import ".." as Root

PanelWindow {
  anchors { top: true; left: true; right: true }
  height: Root.Theme.barHeight
  color: "transparent"
  z: 10
  margins { top: 6; left: 8; right: 8 }

  Rectangle {
    anchors.fill: parent
    color: Root.Theme.bgAlt
    radius: Root.Theme.radius
    opacity: 0.92
  }

  Row {
    anchors { left: parent.left; verticalCenter: parent.verticalCenter; leftMargin: Root.Theme.padding }
    spacing: Root.Theme.spacing
    height: parent.height

    Workspaces {}
  }

  Row {
    anchors { right: parent.right; verticalCenter: parent.verticalCenter; rightMargin: Root.Theme.padding }
    spacing: Root.Theme.spacing
    height: parent.height

    Volume {}
    Network {}
    Battery {}
    SystemTray {}
    Clock {}
  }
}

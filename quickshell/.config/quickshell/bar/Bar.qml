import QtQuick
import Quickshell
import Quickshell.Wayland
import ".." as Root
import ".." as Root

PanelWindow {
  anchors { top: true; left: true; right: true }
  height: Root.Theme.barHeight
  color: Root.Theme.bg
  z: 10

  Rectangle {
    anchors.fill: parent
    color: Root.Theme.bgAlt
    radius: 0
    opacity: 0.95
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
    SystemTray {}
    Clock {}
  }
}

import QtQuick
import Quickshell
import Quickshell.Hyprland
import "Theme.qml" as Theme

Item {
  implicitWidth: workspaceRow.width
  implicitHeight: Theme.barHeight

  property var workspaces: Hyprland.workspaces

  Row {
    id: workspaceRow
    anchors.centerIn: parent
    spacing: 3

    Repeater {
      model: 5

      Rectangle {
        width: 24
        height: 22
        radius: Theme.radius
        color: {
          if (index + 1 === Hyprland.focusedWorkspace.id) return Theme.accent
          if (workspaces.has(index + 1)) return Theme.surface
          return Theme.bg
        }
        opacity: {
          if (index + 1 === Hyprland.focusedWorkspace.id) return 1.0
          if (workspaces.has(index + 1)) return 0.8
          return 0.5
        }

        Text {
          anchors.centerIn: parent
          text: index + 1
          color: index + 1 === Hyprland.focusedWorkspace.id ? Theme.bg : Theme.fg
          font.pixelSize: Theme.fontSize
          font.bold: index + 1 === Hyprland.focusedWorkspace.id
        }

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("workspace", index + 1)
        }
      }
    }
  }
}

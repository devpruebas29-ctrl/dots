import QtQuick
import Quickshell
import Quickshell.Hyprland

Item {
  implicitWidth: workspaceRow.width
  implicitHeight: Root.Theme.barHeight

  property var workspaces: Hyprland.workspaces

  Row {
    id: workspaceRow
    anchors.centerIn: parent
    spacing: 4

    Repeater {
      model: 5

      Rectangle {
        width: 28
        height: 28
        radius: Root.Theme.radius
        color: {
          if (index + 1 === Hyprland.focusedWorkspace.id) return Root.Theme.accent
          if (workspaces.has(index + 1)) return Root.Theme.surface
          return Root.Theme.bgAlt
        }
        opacity: {
          if (index + 1 === Hyprland.focusedWorkspace.id) return 1.0
          if (workspaces.has(index + 1)) return 0.8
          return 0.5
        }
        border.width: index + 1 === Hyprland.focusedWorkspace.id ? 0 : 1
        border.color: Root.Theme.surfaceAlt

        Text {
          anchors.centerIn: parent
          text: index + 1
          color: index + 1 === Hyprland.focusedWorkspace.id ? Root.Theme.bg : Root.Theme.fg
          font.pixelSize: Root.Theme.fontSizeSmall
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

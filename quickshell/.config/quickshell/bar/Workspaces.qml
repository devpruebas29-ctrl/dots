import QtQuick
import Quickshell
import Quickshell.Hyprland
import "Theme.qml" as Theme

Item {
  implicitWidth: 132
  implicitHeight: Theme.barHeight

  Row {
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    spacing: 3

    Repeater {
      model: 5

      Rectangle {
        width: 24
        height: 22
        radius: Theme.radius
        color: {
          var focused = Hyprland.focusedWorkspace
          var wid = focused ? focused.id : 0
          var occ = false
          for (var i = 0; i < Hyprland.workspaces.length; i++) {
            if (Hyprland.workspaces[i].id === index + 1) {
              occ = true
              break
            }
          }
          if (index + 1 === wid) return Theme.accent
          if (occ) return Theme.surface
          return Theme.bg
        }

        Text {
          anchors.centerIn: parent
          text: index + 1
          color: {
            var focused = Hyprland.focusedWorkspace
            var wid = focused ? focused.id : 0
            index + 1 === wid ? Theme.bg : Theme.fg
          }
          font.pixelSize: Theme.fontSize
          font.bold: {
            var focused = Hyprland.focusedWorkspace
            var wid = focused ? focused.id : 0
            index + 1 === wid
          }
        }

        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("workspace", index + 1)
        }
      }
    }
  }
}

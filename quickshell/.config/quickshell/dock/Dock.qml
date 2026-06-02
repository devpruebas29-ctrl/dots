import QtQuick
import Quickshell
import Quickshell.Wayland
import "Theme.qml" as Theme

PanelWindow {
  id: root
  visible: false
  anchors { bottom: true; left: true; right: true }
  height: 60
  color: "#E6181825"

  Row {
    anchors.centerIn: parent
    spacing: 12

    Repeater {
      model: ["\uD83C\uDF4E", "\uD83D\uDCDD", "\u2699\uFE0F", "\uD83D\uDCF7"]

      Rectangle {
        width: 40
        height: 40
        radius: Theme.radius
        color: Theme.surface

        Text {
          anchors.centerIn: parent
          text: modelData
          font.pixelSize: 20
        }

        MouseArea {
          anchors.fill: parent
          onClicked: print("Clicked:", modelData)
        }
      }
    }
  }
}

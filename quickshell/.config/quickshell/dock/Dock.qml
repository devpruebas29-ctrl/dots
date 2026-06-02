import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
  id: root
  visible: false
  anchors { bottom: true; left: true; right: true }
  height: 60
  color: Root.Theme.bgAlt
  opacity: 0.9
  z: 20

  property bool visible: false

  Row {
    anchors.centerIn: parent
    spacing: 12

    Repeater {
      model: ["\uD83C\uDF4E", "\uD83D\uDCDD", "\u2699\uFE0F", "\uD83D\uDCF7"]

      Rectangle {
        width: 40
        height: 40
        radius: Root.Theme.radius
        color: Root.Theme.surface

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

import QtQuick
import Quickshell
import "Theme.qml" as Theme

Rectangle {
  id: root
  visible: false
  anchors.fill: parent
  color: "#000000"
  opacity: 0.85

  property bool locked: false

  Text {
    anchors.centerIn: parent
    text: "Pantalla bloqueada"
    color: "white"
    font.pixelSize: 24
    font.family: Theme.fontFamily
  }
}

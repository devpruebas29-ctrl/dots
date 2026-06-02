import QtQuick
import Quickshell

Rectangle {
  id: root
  visible: false
  anchors.fill: parent
  color: "#000000"
  opacity: 0.85
  z: 100

  property bool locked: false
  property string password: ""

  Text {
    anchors.centerIn: parent
    text: "Pantalla bloqueada"
    color: "white"
    font.pixelSize: 24
    font.family: Root.Theme.fontFamily
  }
}

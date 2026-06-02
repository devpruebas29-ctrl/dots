import QtQuick
import Quickshell

Rectangle {
  id: root
  visible: false
  anchors.fill: parent
  color: Root.Theme.bg
  opacity: 0.95
  z: 50

  property bool visible: false

  Column {
    anchors.centerIn: parent
    spacing: 20

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Dashboard"
      color: Root.Theme.fg
      font.pixelSize: Root.Theme.fontSizeLarge
      font.family: Root.Theme.fontFamily
      font.bold: true
    }

    Rectangle {
      width: 300
      height: 2
      color: Root.Theme.accent
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Controles rapidos aqui"
      color: Root.Theme.fgAlt
      font.pixelSize: Root.Theme.fontSize
      font.family: Root.Theme.fontFamily
    }
  }

  MouseArea {
    anchors.fill: parent
    onClicked: root.visible = false
  }
}

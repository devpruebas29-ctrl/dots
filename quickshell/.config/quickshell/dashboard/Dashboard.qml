import QtQuick
import Quickshell
import "Theme.qml" as Theme

Rectangle {
  id: root
  visible: false
  anchors.fill: parent
  color: Theme.bg
  opacity: 0.95

  Column {
    anchors.centerIn: parent
    spacing: 20

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Dashboard"
      color: Theme.fg
      font.pixelSize: Theme.fontSizeLarge
      font.family: Theme.fontFamily
      font.bold: true
    }

    Rectangle {
      width: 300
      height: 2
      color: Theme.accent
      anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: "Controles rapidos aqui"
      color: Theme.fgAlt
      font.pixelSize: Theme.fontSize
      font.family: Theme.fontFamily
    }
  }

  MouseArea {
    anchors.fill: parent
    onClicked: root.visible = false
  }
}

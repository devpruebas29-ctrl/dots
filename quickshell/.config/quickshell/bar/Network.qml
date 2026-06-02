import QtQuick
import Quickshell

Item {
  implicitWidth: 22
  implicitHeight: Root.Theme.barHeight

  Text {
    anchors.centerIn: parent
    text: "\uF1EB"
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
    color: Root.Theme.blue
  }
}

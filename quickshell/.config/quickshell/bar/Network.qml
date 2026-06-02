import QtQuick
import Quickshell

Item {
  implicitWidth: 24
  implicitHeight: Root.Theme.barHeight

  Text {
    anchors.centerIn: parent
    text: "\uD83C\uDF10"
    font.pixelSize: Root.Theme.fontSize
    color: Root.Theme.fg
  }
}

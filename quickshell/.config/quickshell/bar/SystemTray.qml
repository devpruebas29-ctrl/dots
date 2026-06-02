import QtQuick
import Quickshell

Item {
  implicitWidth: 24
  implicitHeight: Root.Theme.barHeight

  Text {
    anchors.centerIn: parent
    text: "\u25A0"
    font.pixelSize: 18
    color: Root.Theme.surfaceAlt
  }
}

import QtQuick
import Quickshell
import "Theme.js" as Theme

Item {
  implicitWidth: 24
  implicitHeight: Theme.barHeight

  Text {
    anchors.centerIn: parent
    text: "\u25A0"
    font.pixelSize: 18
    color: Theme.surfaceAlt
  }
}

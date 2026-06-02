import QtQuick
import Quickshell
import "Theme.qml" as Theme

Item {
  implicitWidth: 22
  implicitHeight: Theme.barHeight

  Text {
    anchors.centerIn: parent
    text: "\uF1EB"
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    color: Theme.blue
  }
}

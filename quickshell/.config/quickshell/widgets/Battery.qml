import QtQuick
import Quickshell
import "Theme.js" as Theme

Rectangle {
  visible: false
  width: 200
  height: 40
  color: Theme.bgAlt
  radius: Theme.radius
  opacity: 0.9

  property int percent: 75
  property bool charging: false

  Text {
    anchors.centerIn: parent
    text: (charging ? "\u26A1 " : "") + percent + "%"
    color: Theme.fg
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
  }
}

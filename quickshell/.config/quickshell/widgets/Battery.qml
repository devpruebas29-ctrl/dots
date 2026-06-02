import QtQuick
import Quickshell

Rectangle {
  visible: false
  width: 200
  height: 40
  color: Root.Theme.bgAlt
  radius: Root.Theme.radius
  opacity: 0.9

  property int percent: 75
  property bool charging: false

  Text {
    anchors.centerIn: parent
    text: (charging ? "\u26A1 " : "") + percent + "%"
    color: Root.Theme.fg
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
  }
}

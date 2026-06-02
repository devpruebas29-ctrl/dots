import QtQuick
import Quickshell

Rectangle {
  visible: false
  width: 200
  height: 40
  color: Root.Theme.bgAlt
  radius: Root.Theme.radius
  opacity: 0.9

  property string title: "No media"
  property string artist: ""

  Text {
    anchors.centerIn: parent
    text: title + (artist ? " - " + artist : "")
    color: Root.Theme.fg
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
    elide: Text.ElideRight
    width: parent.width - 16
  }
}

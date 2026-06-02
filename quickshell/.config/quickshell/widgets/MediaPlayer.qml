import QtQuick
import Quickshell
import "Theme.qml" as Theme

Rectangle {
  visible: false
  width: 200
  height: 40
  color: Theme.bgAlt
  radius: Theme.radius
  opacity: 0.9

  property string title: "No media"
  property string artist: ""

  Text {
    anchors.centerIn: parent
    text: title + (artist ? " - " + artist : "")
    color: Theme.fg
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    elide: Text.ElideRight
    width: parent.width - 16
  }
}

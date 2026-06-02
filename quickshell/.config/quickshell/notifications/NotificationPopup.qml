import QtQuick
import Quickshell

Item {
  id: root

  Rectangle {
    id: popup
    visible: false
    x: parent.width - width - Root.Theme.padding
    y: Root.Theme.barHeight + Root.Theme.spacing
    width: 320
    height: 80
    color: Root.Theme.bgAlt
    radius: Root.Theme.radius
    opacity: 0.95

    property string message: ""

    Text {
      anchors {
        centerIn: parent
        margins: Root.Theme.padding
      }
      text: popup.message
      color: Root.Theme.fg
      font.pixelSize: Root.Theme.fontSize
      font.family: Root.Theme.fontFamily
      wrapMode: Text.WordWrap
      width: parent.width - 2 * Root.Theme.padding
    }
  }

  function show(text) {
    popup.message = text
    popup.visible = true
    hideTimer.start()
  }

  Timer {
    id: hideTimer
    interval: 3000
    onTriggered: popup.visible = false
  }
}

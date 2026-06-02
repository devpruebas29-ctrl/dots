import QtQuick
import Quickshell
import "Theme.qml" as Theme

Item {
  id: root

  Rectangle {
    id: popup
    visible: false
    x: parent.width - width - Theme.padding
    y: Theme.barHeight + Theme.spacing
    width: 320
    height: 80
    color: Theme.bgAlt
    radius: Theme.radius
    opacity: 0.95

    property string message: ""

    Text {
      anchors {
        centerIn: parent
        margins: Theme.padding
      }
      text: popup.message
      color: Theme.fg
      font.pixelSize: Theme.fontSize
      font.family: Theme.fontFamily
      wrapMode: Text.WordWrap
      width: parent.width - 2 * Theme.padding
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

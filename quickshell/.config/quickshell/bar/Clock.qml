import QtQuick
import Quickshell

Item {
  implicitWidth: clockText.width + 8
  implicitHeight: Root.Theme.barHeight

  property string timeString: ""

  Timer {
    interval: 1000
    running: true
    repeat: true
    onTriggered: {
      var d = new Date()
      timeString = d.toLocaleString(Qt.locale(), "HH:mm")
    }
  }

  Text {
    id: clockText
    anchors.centerIn: parent
    text: parent.timeString
    color: Root.Theme.fg
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
  }
}

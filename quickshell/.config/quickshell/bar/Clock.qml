import QtQuick
import Quickshell
import "Theme.qml" as Theme

Item {
  implicitWidth: 60
  implicitHeight: Theme.barHeight

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
    id: clockIcon
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    text: "\uF017"
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    color: Theme.magenta
  }

  Text {
    id: clockText
    anchors { left: clockIcon.right; leftMargin: 4; verticalCenter: parent.verticalCenter }
    text: parent.timeString
    color: Theme.fg
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
  }
}

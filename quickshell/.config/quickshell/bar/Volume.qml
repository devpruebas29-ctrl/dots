import QtQuick
import Quickshell
import "Theme.qml" as Theme

Item {
  id: root
  implicitWidth: volText.width + volPct.width + 10
  implicitHeight: Theme.barHeight

  property int volumePercent: 0

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: {
      Quickshell.Process.exec("/bin/sh", ["-c", "pamixer --get-volume 2>/dev/null || echo 0"])
        .then(out => { root.volumePercent = parseInt(out.stdout.trim()) })
    }
    Component.onCompleted: onTriggered()
  }

  Text {
    id: volText
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    text: {
      if (parent.volumePercent <= 0) return "\uF026"
      if (parent.volumePercent < 33) return "\uF027"
      return "\uF028"
    }
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    color: Theme.green
  }

  Text {
    id: volPct
    anchors { left: volText.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
    text: parent.volumePercent + "%"
    color: Theme.fgAlt
    font.pixelSize: Theme.fontSizeSmall
    font.family: Theme.fontFamily
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      Quickshell.Process.exec("/bin/sh", ["-c",
        root.volumePercent > 0 ? "pamixer -t" : "pamixer -u"])
    }
  }
}

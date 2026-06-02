import QtQuick
import Quickshell
import "Theme.qml" as Theme

Item {
  id: root
  implicitWidth: batText.width + batPct.width + 10
  implicitHeight: Theme.barHeight

  property int percent: 0
  property bool charging: false

  Timer {
    interval: 5000
    running: true
    repeat: true
    onTriggered: {
      Quickshell.Process.exec("/bin/sh", ["-c", "cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo 0"])
        .then(out => { root.percent = parseInt(out.stdout.trim()) })
      Quickshell.Process.exec("/bin/sh", ["-c", "cat /sys/class/power_supply/BAT0/status 2>/dev/null || echo Unknown"])
        .then(out => { root.charging = out.stdout.trim() === "Charging" })
    }
    Component.onCompleted: onTriggered()
  }

  Text {
    id: batText
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    text: {
      if (parent.charging) return "\uF0E7"
      if (parent.percent <= 10) return "\uF244"
      if (parent.percent <= 30) return "\uF243"
      if (parent.percent <= 60) return "\uF242"
      if (parent.percent <= 90) return "\uF241"
      return "\uF240"
    }
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    color: {
      if (parent.percent <= 10) return Theme.red
      if (parent.percent <= 30) return Theme.orange
      return Theme.yellow
    }
  }

  Text {
    id: batPct
    anchors { left: batText.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
    text: parent.percent + "%"
    color: Theme.fgAlt
    font.pixelSize: Theme.fontSizeSmall
    font.family: Theme.fontFamily
  }
}

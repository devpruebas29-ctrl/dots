import QtQuick
import Quickshell
import Quickshell.Services.UPower
import "Theme.js" as Theme

Item {
  id: root
  implicitWidth: 50
  implicitHeight: Theme.barHeight

  property int percent: UPower.displayDevice ? Math.round(UPower.displayDevice.percentage) : 0
  property bool charging: UPower.displayDevice ? UPower.displayDevice.state === UPowerDeviceState.Charging : false

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

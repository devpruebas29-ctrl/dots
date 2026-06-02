import QtQuick
import Quickshell

Item {
  implicitWidth: batText.width + batPct.width + 10
  implicitHeight: Root.Theme.barHeight

  property int percent: 75
  property bool charging: false

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
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
    color: {
      if (parent.percent <= 10) return Root.Theme.red
      if (parent.percent <= 30) return Root.Theme.orange
      return Root.Theme.yellow
    }
  }

  Text {
    id: batPct
    anchors { left: batText.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
    text: parent.percent + "%"
    color: Root.Theme.fgAlt
    font.pixelSize: Root.Theme.fontSizeSmall
    font.family: Root.Theme.fontFamily
  }
}

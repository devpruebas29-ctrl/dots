import QtQuick
import Quickshell

Item {
  implicitWidth: volText.width + volPct.width + 10
  implicitHeight: Root.Theme.barHeight

  property int volumePercent: 50

  Text {
    id: volText
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    text: {
      if (parent.volumePercent <= 0) return "\uF026"
      if (parent.volumePercent < 33) return "\uF027"
      return "\uF028"
    }
    font.pixelSize: Root.Theme.fontSize
    font.family: Root.Theme.fontFamily
    color: Root.Theme.green
  }

  Text {
    id: volPct
    anchors { left: volText.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
    text: parent.volumePercent + "%"
    color: Root.Theme.fgAlt
    font.pixelSize: Root.Theme.fontSizeSmall
    font.family: Root.Theme.fontFamily
  }

  MouseArea {
    anchors.fill: parent
    onClicked: parent.volumePercent = parent.volumePercent >= 100 ? 0 : parent.volumePercent + 10
  }
}

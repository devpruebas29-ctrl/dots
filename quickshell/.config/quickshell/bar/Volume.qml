import QtQuick
import Quickshell

Item {
  implicitWidth: volText.width + 8
  implicitHeight: Root.Theme.barHeight

  property int volumePercent: 50

  Text {
    id: volText
    anchors.centerIn: parent
    text: {
      if (parent.volumePercent <= 0) return "\uD83D\uDD07"
      if (parent.volumePercent < 33) return "\uD83D\uDD08"
      if (parent.volumePercent < 66) return "\uD83D\uDD09"
      return "\uD83D\uDD0A"
    }
    font.pixelSize: Root.Theme.fontSize
    color: Root.Theme.fg
  }

  Text {
    anchors {
      left: volText.right
      leftMargin: 4
      verticalCenter: parent.verticalCenter
    }
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

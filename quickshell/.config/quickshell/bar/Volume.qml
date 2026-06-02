import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import "Theme.qml" as Theme

Item {
  id: root
  implicitWidth: 50
  implicitHeight: Theme.barHeight

  property int volumePercent: Pipewire.defaultAudioSink ? Math.round(Pipewire.defaultAudioSink.volume * 100) : 0
  property bool muted: Pipewire.defaultAudioSink ? Pipewire.defaultAudioSink.muted : false

  Text {
    id: volText
    anchors { left: parent.left; verticalCenter: parent.verticalCenter }
    text: {
      if (root.muted || root.volumePercent <= 0) return "\uF026"
      if (root.volumePercent < 33) return "\uF027"
      return "\uF028"
    }
    font.pixelSize: Theme.fontSize
    font.family: Theme.fontFamily
    color: root.muted ? Theme.fgAlt : Theme.green
  }

  Text {
    id: volPct
    anchors { left: volText.right; leftMargin: 3; verticalCenter: parent.verticalCenter }
    text: (root.muted ? "M" : root.volumePercent) + "%"
    color: Theme.fgAlt
    font.pixelSize: Theme.fontSizeSmall
    font.family: Theme.fontFamily
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      if (Pipewire.defaultAudioSink)
        Pipewire.defaultAudioSink.muted = !Pipewire.defaultAudioSink.muted
    }
  }
}

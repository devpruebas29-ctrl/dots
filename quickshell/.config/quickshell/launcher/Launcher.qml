import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import "Theme.js" as Theme

PopupWindow {
  id: root
  implicitWidth: 600
  implicitHeight: 500
  visible: false

  property var allApps: []
  property string query: ""
  property int selectedIndex: 0

  ListModel { id: filteredModel }

  function open() {
    visible = true
    searchInput.forceActiveFocus()
    animOpen.start()
  }

  function close() {
    animClose.start()
  }

  function toggle() {
    if (visible) close()
    else open()
  }

  function updateFilter() {
    filteredModel.clear()
    var q = query.toLowerCase().trim()
    for (var i = 0; i < allApps.length && i < 15; i++) {
      var name = allApps[i].name
      if (q.length === 0 || name.toLowerCase().indexOf(q) !== -1) {
        filteredModel.append({ name: name, exec: allApps[i].exec })
      }
    }
    selectedIndex = 0
  }

  function launch(index) {
    if (index < 0 || index >= filteredModel.count) return
    var app = filteredModel.get(index)
    if (app.exec) Hyprland.dispatch("exec", app.exec)
    root.close()
  }

  Process {
    id: fifoReader
    command: ["cat", "/tmp/quickshell-launcher-fifo"]
    running: false
  }

  Component.onCompleted: {
    var col = Qt.createQmlObject(
      'import Quickshell.Io; StdioCollector { waitForEnd: true; objectName: "fifoCol" }',
      fifoReader, "fifoCol"
    )
    if (col === null) return
    col.streamFinished.connect(function() {
      var msg = col.text.trim()
      if (msg === "toggle") root.toggle()
      fifoReader.running = true
    })
    fifoReader.stdout = col
    fifoReader.running = true

    var xhr = new XMLHttpRequest()
    xhr.open("GET", "file:///home/wilmer/.config/quickshell/launcher/apps.json")
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        if (xhr.status === 0 || xhr.status === 200) {
          try { allApps = JSON.parse(xhr.responseText); updateFilter() }
          catch(e) { print("Parse error:", e) }
        }
      }
    }
    xhr.send()
  }

  NumberAnimation {
    id: animOpen
    target: content
    property: "opacity"
    from: 0
    to: 1
    duration: 150
    easing.type: Easing.OutCubic
  }

  NumberAnimation {
    id: animClose
    target: content
    property: "opacity"
    from: 1
    to: 0
    duration: 100
    onFinished: visible = false
  }

  Rectangle {
    anchors.fill: parent
    color: "#000000"
    opacity: 0.5
    MouseArea { anchors.fill: parent; onClicked: root.close() }
  }

  Item {
    id: content
    anchors.centerIn: parent
    width: 520
    height: 420
    opacity: 0

    Rectangle {
      anchors.fill: parent
      color: Theme.bgAlt
      radius: Theme.radius + 4
      opacity: 0.95
    }

    Column {
      anchors { fill: parent; margins: 12 }
      spacing: 8

      Rectangle {
        width: parent.width
        height: 40
        color: Theme.surface
        radius: Theme.radius

        TextInput {
          id: searchInput
          anchors { left: parent.left; verticalCenter: parent.verticalCenter; leftMargin: 12 }
          width: parent.width - 24
          color: Theme.fg
          font.pixelSize: Theme.fontSize + 2
          font.family: Theme.fontFamily
          selectByMouse: true
          activeFocusOnPress: true

          Keys.onPressed: function(event) {
            if (event.key === Qt.Key_Escape) root.close()
            else if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) root.launch(selectedIndex)
            else if (event.key === Qt.Key_Down) {
              selectedIndex = Math.min(selectedIndex + 1, filteredModel.count - 1)
              resultList.positionViewAtIndex(selectedIndex, ListView.Contain)
            } else if (event.key === Qt.Key_Up) {
              selectedIndex = Math.max(selectedIndex - 1, 0)
              resultList.positionViewAtIndex(selectedIndex, ListView.Contain)
            }
          }

          onTextChanged: { query = text; root.updateFilter() }
        }
      }

      ListView {
        id: resultList
        width: parent.width
        height: parent.height - 48
        clip: true
        model: filteredModel
        currentIndex: selectedIndex

        delegate: Item {
          width: parent.width
          height: 42

          Rectangle {
            anchors.fill: parent
            radius: Theme.radius
            color: selectedIndex === index ? Theme.surface : "transparent"
            Behavior on color { ColorAnimation { duration: 80 } }

            Row {
              anchors { left: parent.left; verticalCenter: parent.verticalCenter; leftMargin: 8 }
              spacing: 10

              Text {
                width: 24; height: 24
                font.pixelSize: 18
                font.family: Theme.fontFamily
                text: "\uF144"
                color: Theme.accent
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
              }

              Text {
                text: model.name
                color: Theme.fg
                font.pixelSize: Theme.fontSize + 1
                font.family: Theme.fontFamily
                anchors.verticalCenter: parent.verticalCenter
                font.bold: selectedIndex === index
              }
            }

            MouseArea {
              anchors.fill: parent
              hoverEnabled: true
              onEntered: selectedIndex = index
              onClicked: root.launch(index)
            }
          }
        }
      }
    }
  }
}

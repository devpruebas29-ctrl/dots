import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "bar" as Bar
import "widgets" as Widgets
import "notifications" as Notifications
import "dock" as Dock

ShellRoot {
  Bar.Bar {}

  Widgets.BatteryWidget {}
  Widgets.MediaPlayerWidget {}

  Notifications.NotificationPopup {}

  Dock.Dock {}

  Lockscreen {
    id: lockscreen
  }

  Dashboard {
    id: dashboard
    visible: false
  }

  Component.onCompleted: {
    Hyprland.ready.then(() => print("Hyprland connected"))
  }
}

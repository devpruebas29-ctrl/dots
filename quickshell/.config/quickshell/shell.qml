import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "bar" as Bar
import "widgets" as Widgets
import "notifications" as Notifications
import "dock" as Dock
import "lockscreen" as LockscreenDir
import "dashboard" as DashboardDir
import "launcher" as LauncherDir

ShellRoot {
  Bar.Bar {}

  Widgets.MediaPlayer {}

  Notifications.NotificationPopup {}

  Dock.Dock {}

  LockscreenDir.Lockscreen {
    id: lockscreen
  }

  DashboardDir.Dashboard {
    id: dashboard
    visible: false
  }

  LauncherDir.Launcher {
    id: launcher
    visible: false
  }

  Component.onCompleted: {
    if (Hyprland.ready) print("Hyprland connected")
  }
}

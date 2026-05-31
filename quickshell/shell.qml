//@ pragma UseQApplication
//@ pragma Env QS_NO_RELOAD_POPUP=1
//@ pragma Env QT_QUICK_CONTROLS_STYLE=Basic

import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import qs.modules.bar
import qs.modules.controlCenter
import qs.modules.settings

ShellRoot {

	PanelWindow {
		focusable: true
		WlrLayershell.layer: WlrLayer.Bottom
		exclusionMode: ExclusionMode.Ignore
		WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
	    color: "transparent"
	    anchors {
            left: true
            right: true
            top: true
            bottom: true
		}	
	}

	PanelWindow{
		id: rootPanel
        exclusionMode: ExclusionMode.Ignore
        implicitHeight: screen.height
        implicitWidth: screen.width
		
		anchors {
            top: true
            bottom: true
            left: true
            right: true
        }
		
		color: "transparent"
		focusable: true

		PanelWindow{
			implicitHeight: 28
			implicitWidth: 0
			anchors.top: true
			color: "transparent"
			mask: rootPanel.mask
		}
		
		Bar {id: topBar}
		
		Loader {
			id:controlCenterLoader
			active:false
			anchors.fill: parent
			sourceComponent: ControlCenter{
				id:controlCenter
				property int topBarHeight: topBar.height
			}
			focus: true
		}

		Loader {
			id:settingsLoader
			active: false
			anchors.fill: parent
			sourceComponent: Settings{
				id: settings
				page: ""
			}
			focus: true
		}

		mask: Region{
			Region{item: topBar}
			Region{item: controlCenterLoader.active && controlCenterLoader.item?.opened ? controlCenterLoader.item : null}
			Region{item: settingsLoader.active && settingsLoader.item?.opened ? settingsLoader.item : null}
		}

	}

	Timer {
        id: closeSettingsTimer
        interval: 600
        onTriggered: settingsLoader.active = false
    }
	
	Connections {
        target: settingsLoader.item
        function onOpenedChanged() {
            if (settingsLoader.item && !settingsLoader.item.opened) {
                closeSettingsTimer.start()
            }
        }
	
	}
	
	IpcHandler{
		id: settingsIpc
		target: "settings"
		function openSettings(x: string):void {
			if(!settingsLoader.active) {
				settingsLoader.active = true

				Qt.callLater(() => {
					if(settingsLoader.item) {
						settingsLoader.item.opened = true
						settingsLoader.item.page = x
						console.log(settings.page)
					}
				})
			} else {
				settingsLoader.item.opened = !settingsLoader.item.opened;
			}
		}
	}

	Timer {
        id: closeControlCenterTimer
        interval: 600
        onTriggered: controlCenterLoader.active = false
    }
	
	Connections {
        target: controlCenterLoader.item
        function onOpenedChanged() {
            if (controlCenterLoader.item && !controlCenterLoader.item.opened) {
                closeControlCenterTimer.start()
            }
        }
	
	}
	
	IpcHandler{
		id: ccIpc
		target: "controlCenter"
		function openCC():void {
			if(!controlCenterLoader.active) {
				controlCenterLoader.active = true

				Qt.callLater(() => {
					if(controlCenterLoader.item) controlCenterLoader.item.opened = true
				})
			} else {
				controlCenterLoader.item.opened = !controlCenterLoader.item.opened;
			}
		}
	}
}

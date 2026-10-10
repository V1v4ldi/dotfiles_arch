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
import qs.modules.settings
import quickshell

ShellRoot {

	PanelWindow{
		id: rootPanel
        exclusionMode: ExclusionMode.Ignore
        implicitHeight: 28
        implicitWidth: screen.width
		
		anchors {
            top: true
            bottom: true
            left: true
            right: true
        }
		
		color: "transparent"
		focusable: true

		Bar {id: topBar}
		
		Loader {
			id:controlCenterLoader
			active:false
			anchors.fill: parent
			focus: true
			
		}

		Loader {
			id:settingsLoader
			active: false
			anchors.fill: parent
			focus: true
		}

		mask: Region{
			Region{item: topBar}
			Region{item: controlCenterLoader.active && controlCenterLoader.item?.opened ? controlCenterLoader.item : null}
			Region{item: settingsLoader.active && settingsLoader.item?.opened ? settingsLoader.item : null}
		}

	}

	IpcHandler{
		id: settingsIpc
		target: "settings"
		function openSettings(x: string):void {
			if(!settingsLoader.active) {
				settingsLoader.setSource(Utils.path("modules/settings/Settings.qml"), {
					"opened": true,
					"dd1": x
				})
				settingsLoader.active = true

			} else {
				settingsLoader.item.opened = !settingsLoader.item.opened;
				settingsLoader.focus = !settingsLoader.focus
			}
		}
	}

	
	IpcHandler{
		id: ccIpc
		target: "controlCenter"
		function openCC():void {
			if(!controlCenterLoader.active) {
				controlCenterLoader.setSource(Utils.path("modules/controlCenter/ControlCenter.qml"), {
					"opened": true
				})

				controlCenterLoader.active = true
			} else {
				controlCenterLoader.item.opened = !controlCenterLoader.item.opened;
			}
		}
	}
}

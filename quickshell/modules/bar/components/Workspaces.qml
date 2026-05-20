import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Core

Row {
	id: wsRoot
	spacing: 12
	height: parent.height

	FontLoader{
		id:kanjifont
		source:"/usr/share/fonts/noto-cjk/NotoSansCJK-Regular.ttc"
	}

	Repeater {
		id: workspaces
		model: 7

		delegate: Rectangle {
			width: parent.height + 24
			height: wsRoot.height
			radius: 10
			color: "transparent"
			border.width: 4
			border.color: {
				
				if (Hyprland.focusedWorkspace && (index + 1 === Hyprland.focusedWorkspace.id)) {
					return Colors.primary
				} else if (wsMouseArea.containsMouse) {
					return Colors.secondary
				} else {
					return "transparent"
				}

			}        
			Text {
				anchors.centerIn: parent
				text: Icons.wsIcons[index]
				font.family: kanjifont.name
				font.pixelSize: parent.height * 0.6
				color: 
					if (Hyprland.focusedWorkspace && (index + 1 === Hyprland.focusedWorkspace.id)) {
						return Colors.primary
					} else if (wsMouseArea.containsMouse) {
						return Colors.secondary
					} else {
						return Colors.secondary
					}
			}

			MouseArea {
				id:wsMouseArea
				anchors.fill: parent
				hoverEnabled: true
				cursorShape: Qt.PointingHandCursor
				onClicked: Hyprland.dispatch("workspace " + (index + 1))
			}
			Behavior on border.color {
				ColorAnimation { duration: 300 }
			}
		}
	}
}

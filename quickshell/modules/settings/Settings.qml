import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.modules.settings.components

Item {
	id: root
	focus:true
	visible: opened

	property bool opened: false

	onOpenedChanged: {
		if(opened) {
			root.visible = true
			settings.y = -settings.height
			openAnim.start()
		} else {
			closeAnim.start()
		}
	}

	function close() {
		opened = false
	}


	Rectangle{
		id: settings 

		implicitWidth: Quickshell.screens[0].width * 0.65
		implicitHeight: Quickshell.screens[0].height * 0.65
		radius: 16
		opacity: 0.85
		border.color: Colors.outline
		y: -height
		x: (Quickshell.screens[0].width / 2) - (settings.implicitWidth / 2)
		color: Colors.background
		
		Close{
			id: close
			implicitHeight: settings.implicitHeight * 0.065
			
			anchors{ 
				top:parent.top
				right: parent.right
				left: parent.left
			}
		}

		Row{
			anchors.top: close.bottom
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			spacing: 0

			Title{
				id:title
				implicitHeight: parent.height
				implicitWidth: parent.width / 4
				color: "transparent"
				layoutHeight: parent.height * 0.075
			}
				
			Rectangle{
				id:content
				implicitHeight: parent.height
				implicitWidth: parent.width - title.width
				color: "transparent"
				bottomRightRadius: 16
			}

		}
	}
	//Animation
	ParallelAnimation{
		id:openAnim
		
		NumberAnimation{
			target: settings; property: "y"
			from: -settings.height; to: (Quickshell.screens[0].height / 2) - (settings.height / 2); duration: 280; easing.type: Easing.InOutCubic
		}
	}

	ParallelAnimation{
		id:closeAnim
		
		NumberAnimation{
			target: settings; property: "y"
			from: (Quickshell.screens[0].height / 2) - (settings.height / 2); to: Quickshell.screens[0].height; duration: 280; easing.type: Easing.InOutCubic
		}
	}
}

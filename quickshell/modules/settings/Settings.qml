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
			visible = true
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
		layer.enabled: true

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
			
			anchors{ 
				top:parent.top
				right: parent.right
				left: parent.left
			}
		}

		RowLayout{
			anchors.top: close.bottom
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			spacing: 0

			Title{
				id:title
				Layout.fillHeight: true
				Layout.preferredWidth: parent.width / 4
				color: "transparent"
			}
				
			Rectangle{
				id:content
				Layout.fillHeight: true
				Layout.fillWidth: true
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
			from: -settings.height; to: (Quickshell.screens[0].height / 2) - (settings.height / 2); duration: 280; easing.type: Easing.InCubic
		}
	}

	ParallelAnimation{
		id:closeAnim
		
		NumberAnimation{
			target: settings; property: "y"
			from: (Quickshell.screens[0].height / 2) - (settings.height / 2); to: Quickshell.screens[0].height; duration: 280; easing.type: Easing.InCubic
		}
	}
}

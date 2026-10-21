import Quickshell
import QtQuick
import QtQuick.Layouts
import "./components"
import quickshell

Item {
	id: root
	visible: opened

	property bool opened: false
	property alias dd1: title.dd1

	onOpenedChanged: {
		if(opened) {
			root.visible = true
			settings.y = -settings.height
			openAnim.start()
			scrim.opacity = 0
		} else {
			closeAnim.start()
		}
	}

	function close() {
		opened = false
	}

	Rectangle{
		id: scrim
		anchors.fill: parent
		opacity: 0
		enabled: opacity > 0.01
		Behavior on opacity { NumberAnimation { duration: 280; easing.type: Easing.OutCubic } }
		
		MouseArea {
            anchors.fill: parent
            enabled: parent.enabled
            onClicked: root.close()
        }
	}

	Rectangle{
		id: settings 

		implicitWidth: Quickshell.screens[0].width * 0.65
		implicitHeight: Quickshell.screens[0].height * 0.65
		radius: 16
		border.color: Colors.outline
		y: -height
		x: (Quickshell.screens[0].width / 2) - (settings.implicitWidth / 2)
		color: Qt.alpha(Colors.background, 0.85)

		Close{
			id: close
			implicitHeight: settings.implicitHeight * 0.095
			
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
				color: Qt.alpha(Colors.on_background, 0.05)
				layoutHeight: parent.height * 0.075
				dd1: root.dd1
			}
				
			Content{
				id:content
				implicitHeight: parent.height
				implicitWidth: parent.width - title.width
				color: "transparent"
				bottomRightRadius: 16
				dd1: root.dd1
			}

		}
	}
	//Animation
	ParallelAnimation{
		id:openAnim

		NumberAnimation{
			target: scrim; property: "opacity"
			to:0.085; duration: 280; easing.type: Easing.InCubic
		}

		NumberAnimation{
			target: settings; property: "y"
			from: -settings.height; to: (Quickshell.screens[0].height / 2) - (settings.height / 2); duration: 280; easing.type: Easing.InOutCubic
		}
	}

	ParallelAnimation{
		id:closeAnim
		
		NumberAnimation{
			target: scrim; property: "opacity"
			to:0; duration: 280; easing.type: Easing.InCubic
		}
		NumberAnimation{
			target: settings; property: "y"
			from: (Quickshell.screens[0].height / 2) - (settings.height / 2); to: Quickshell.screens[0].height; duration: 280; easing.type: Easing.InOutCubic
		}
	}

	Timer{
		id:closeTimer
		interval:600
		running:!root.opened
		onTriggered:{
			if(root.parent){
				root.parent.active = false
			}
		}
	}

	Shortcut{
		sequences: ["Escape"]
		enabled: root.opened
		onActivated: {
			root.opened = false
		}
	}
}

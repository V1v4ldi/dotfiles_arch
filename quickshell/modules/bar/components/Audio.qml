import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services as Service
import qs.Widgets.bar
import qs.Core

Row {
	id:audioRoot
	spacing: 18

	Item {
		id: micTextArea
		clip: true
		state: "hidden"

		implicitHeight: micWid.height
		anchors.verticalCenter: parent.verticalCenter

		states: [
			State { 
				name: "hidden"
				PropertyChanges {target: micTextArea; width: 0}
			},

			State { 
				name: "visible"
				PropertyChanges {target: micTextArea; width: micWid.implicitWidth}
			}

		]

		transitions: [
			Transition {
				NumberAnimation {target:micTextArea; property: "width"; duration: 250; easing.type: Easing.InOutQuad}
			}

		]
	
		AudioWidget{
			id: micWid
			
			text: Math.round(Service.Audio.micVolume * 100) + "%"
			icon: Service.Audio.micMuted ? Icons.micMute : Icons.mic
			visibility: !Service.Audio.micMuted
		}	

		MouseArea {
			id: micAreaButton
			anchors.fill: parent

			cursorShape: Qt.PointingHandCursor
			hoverEnabled: true
			
			onClicked: {Service.Audio.toggleMute("Source")}
		
			onWheel: (wheel) => {wheel.angleDelta.y > 0 ? Service.Audio.volumeInc("Source") : Service.Audio.volumeDec("Source")}

			onEntered: {
				hoverTimer.targetState = "visible"
				hoverTimer.restart()
			}

			onExited: {
				hoverTimer.targetState = "hidden"
				hoverTimer.restart()
			}

		}
	}

	Item {
		id: speakerTextArea

		width: speakerWid.implicitWidth 
		implicitHeight: micWid.height

		anchors.verticalCenter: parent.verticalCenter

	
		AudioWidget{
			id:speakerWid	

			text: Math.round(Service.Audio.volume * 100) + "%"
			icon: {
				(Service.Audio?.muted ?? false) ? Icons.mute :
				(Service.Audio?.volume * 100 ?? 0) <= 25 ? Icons.volumeLow :
				(Service.Audio?.volume * 100 ?? 0) <= 50 ? Icons.volumeMed : Icons.volumeHigh
			}
			visibility: !Service.Audio.micMuted
		}

		MouseArea {
			id: speakerAreaButton
			anchors.fill: parent
			
			cursorShape: Qt.PointingHandCursor
			hoverEnabled: true

			onClicked: {Service.Audio.toggleMute("Sink")}
		
			onWheel: (wheel) => {wheel.angleDelta.y > 0 ? Service.Audio.volumeInc("Sink") : Service.Audio.volumeDec("Sink")}
			
			onEntered: {
				hoverTimer.targetState = "visible"
				hoverTimer.restart()
			}
			onExited: {
				hoverTimer.targetState = "hidden"
				hoverTimer.restart()
			}
	
		}
	}

	Timer {
		id:hoverTimer
		repeat:false
		interval:80

		property string targetState: ""

		onTriggered: {
			micTextArea.state = targetState
		}
	}
}

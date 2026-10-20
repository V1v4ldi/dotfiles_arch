import Quickshell
import QtQuick
import QtQuick.Layouts
import quickshell

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
	
		MetricPillWid{
			id: micWid
			
			text: Math.round(Audio.micVolume * 100) + "%"
			icon: Audio.micMuted | Audio.micVolume == 0 ? Icons.micMute : Icons.mic
			visibility: !Audio.micMuted

			mode: "compact"
		}	

		MouseArea {
			id: micAreaButton
			anchors.fill: parent

			cursorShape: Qt.PointingHandCursor
			hoverEnabled: true
			
			onClicked: {Audio.toggleMute("Source")}
		
			onWheel: (wheel) => {wheel.angleDelta.y > 0 ? Audio.volumeInc("Source") : Service.Audio.volumeDec("Source")}

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

	
		MetricPillWid{
			id:speakerWid	

			visibility: !Audio.muted
			text: Math.round(Audio.volume * 100) + "%"
			icon: (Audio?.muted | Audio.volume == 0 ?? false) ? Icons.mute :
				((Audio?.volume * 100 ?? 0) <= 25) ? Icons.volumeLow :
				((Audio?.volume * 100 ?? 0) <= 50) ? Icons.volumeMed : Icons.volumeHigh
			
			mode: "compact"
		}

		MouseArea {
			id: speakerAreaButton
			anchors.fill: parent
			
			cursorShape: Qt.PointingHandCursor
			hoverEnabled: true

			onClicked: {Audio.toggleMute("Sink")}
			onWheel: (wheel) => {wheel.angleDelta.y > 0 ? Audio.volumeInc("Sink") : Service.Audio.volumeDec("Sink")}
			
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

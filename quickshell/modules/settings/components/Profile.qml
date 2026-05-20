import Quickshell
import QtQuick

Item{
	visible: true
	implicitWidth: parent.width
	implicitHeight: parent.height


	Rectangle{
		id: profileSection
		anchors.fill: parent
		color: "black"
		
		Rectangle{
			anchors.centerIn: parent
			color: pink

//			property real maxWidth: Math.max()
//			property real maxHeight:
			
			Text{
				anchors.centerIn: parent
				text: "Profile"
				font.pixelSize: 18
				color: "red"
			}

		}

	}
}

import Quickshell
import QtQuick

Item{
	visible: true
	implicitWidth: parent.width
	implicitHeight: parent.height


	Rectangle{
		id: btSection
		anchors.fill: parent
		color: "black"
		Rectangle{
			anchors.centerIn: parent
			Text{
				anchors.centerIn: parent
				text: "Bluetooth"
				font.pixelSize: 18
				color: "red"
			}
		}
	}
}

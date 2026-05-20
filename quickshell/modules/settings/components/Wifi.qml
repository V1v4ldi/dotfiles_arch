import Quickshell
import QtQuick

Item{
	visible: true
	implicitWidth: parent.width
	implicitHeight: parent.height


	Rectangle{
		id: wifiSection
		anchors.fill: parent
		color: "black"
		Rectangle{
			anchors.centerIn: parent
			Text{
				anchors.centerIn: parent
				text: "Wifi"
				font.pixelSize: 18
				color: "red"
			}
		}
	}
}

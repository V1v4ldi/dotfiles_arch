import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

RowLayout{
	id: root
	spacing:16

	property alias connectionIcon: icon.text
	property alias connectionText: connectedText.text

	Rectangle{
		width: 48
		height: 48
		radius: width / 2
		Layout.alignment: Qt.AlignLeft
		color: Colors.on_primary_container
			
		Text{
			id: icon
			anchors.centerIn: parent

			font.pixelSize:FontAndSizeRule.fontSize + 10
			font.family: FontAndSizeRule.fontFamily
			color: Colors.on_secondary
			text: root.connectionIcon		
		}
	}

	Text{
		id: connectedText
		Layout.alignment: Qt.AlignVCenter
		font.pixelSize:FontAndSizeRule.fontSize
		font.family: FontAndSizeRule.fontFamily
		color: Colors.on_surface

		text: root.connectionIcon
	}
}

import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

RowLayout{
	id:root
	Rectangle{
		width: 48
		height: 48
		radius: width / 2
		color: Colors.on_primary_container
			
		Text{
			id: icon
			anchors.centerIn: parent

			font.pixelSize:FontAndSizeRule.fontSize + 10
			font.family: FontAndSizeRule.fontFamily
			color: Colors.on_secondary
			text: Icons.right
		}
	}
}


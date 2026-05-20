import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

RowLayout{
	id: root
	spacing:16

	Rectangle{
		width: 48
		height: 48
		radius: width / 2
		Layout.alignment: Qt.AlignLeft
			
		Text{
			id: icon
			anchors.centerIn: parent

			font.pixelSize:FontAndSizeRule.fontSize + 10
			font.family: FontAndSizeRule.fontFamily
			color: "black"
			text: Service.Bluetooth.bluetoothEnabled ? Icons.btConnect : Icons.btDisconnect
		}
	}

	Text{
		id: connectedText
		Layout.alignment: Qt.AlignVCenter
		font.pixelSize:FontAndSizeRule.fontSize
		font.family: FontAndSizeRule.fontFamily
		color: Colors.primary

		text: Colors.on_background
	}
}

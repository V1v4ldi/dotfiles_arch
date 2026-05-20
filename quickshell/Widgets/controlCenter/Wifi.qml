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
			text: Service.Network.wifiEnabled ? Icons.wifiFull : Icons.wifiDisconnect
			
		}
	}

	Text{
		id: connectedText
		Layout.alignment: Qt.AlignVCenter
		font.pixelSize:FontAndSizeRule.fontSize
		font.family: FontAndSizeRule.fontFamily
		color: "white"

		text: Service.Network.wifi?.name ?? "Not Connected"
	}
}

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.Core
import quickshell

Rectangle{
	id:root
	height: 60
	color: "transparent"
	property string dd1: ""

	Rectangle{
		id: background
		anchors.fill: parent
		color: Qt.alpha(Colors.on_primary, 0.1)
		radius: 12
		clip: true
	}

	RowLayout{
		id: btRow
		anchors.fill: parent
		
		MouseArea{	
			width: btIcon.width
			height: btIcon.height
			Layout.leftMargin: 15	
			cursorShape: Qt.PointingHandCursor
			onClicked: settingsIpc.openSettings()

			ConnectionWid{
				id: btIcon
				connectionIcon: Bluetooth.bluetoothEnabled ? Icons.btConnect : Icons.btDisconnect
				connectionText: Bluetooth.deviceName
			}
		}

		Item{
			Layout.fillWidth: true
		}

		MouseArea{
			width: rightIcon.width
			height: rightIcon.height
			Layout.rightMargin: 15	
			cursorShape: Qt.PointingHandCursor
			onClicked: {
				settingsIpc.openSettings("conn")
				ccIpc.openCC()
			}
			
			RightIconWid{
				id: rightIcon
			}
		}
	}
}

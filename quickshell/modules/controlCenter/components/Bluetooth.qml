import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.Widgets.controlCenter
import qs.Core

Rectangle{
	id:root
	height: 60
	color: "transparent"

	Rectangle{
		id: background
		anchors.fill: parent
		color: Colors.primary_container
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

			
			ConnectionWidget{
				id: btIcon
				connectionIcon: Service.Bluetooth.bluetoothEnabled ? Icons.btConnect : Icons.btDisconnect
				connectionText: Service.Bluetooth.deviceName
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
				settingsIpc.openSettings()
				ccIpc.openCC()
			}
			
			RightIcon{
				id: rightIcon
			}
		}
		
	}
}

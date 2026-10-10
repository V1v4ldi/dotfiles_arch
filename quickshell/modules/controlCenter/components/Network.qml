import QtQuick
import QtQuick.Layouts
import Quickshell
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
		id: wifiRow
		anchors.fill: parent
		
		MouseArea{
			width: wifiIcon.width
			height: wifiIcon.height
			Layout.leftMargin: 15	
			cursorShape: Qt.PointingHandCursor
			onClicked: {console.log("Tes")}
			
			ConnectionWid{
				id: wifiIcon
				connectionIcon: Network.wifiEnabled ? Icons.wifiFull : Icons.wifiDisconnect
				connectionText: Network?.wifiName
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
				settingsIpc.openSettings("wf")
				ccIpc.openCC()
			} 
			
			RightIconWid{
				id: rightIcon
			}
		}
		
	}
}

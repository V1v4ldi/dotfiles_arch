import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Widgets.controlCenter
import qs.Core
import qs.services as Service

Rectangle{
	id:root
	height: 60
	color: "transparent"
	property string page: ""

	Rectangle{
		id: background
		anchors.fill: parent
		color: Colors.primary_container
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
			
			ConnectionWidget{
				id: wifiIcon
				connectionIcon: Service.Network.wifiEnabled ? Icons.wifiFull : Icons.wifiDisconnect
				connectionText: Service.Network?.wifiName
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
			
			RightIcon{
				id: rightIcon
			}
		}
		
	}
}

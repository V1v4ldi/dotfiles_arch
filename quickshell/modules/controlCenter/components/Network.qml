import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.Widgets.controlCenter

Rectangle{
	id:root
	height: 60
	color: "transparent"

	Rectangle{
		id: background
		anchors.fill: parent
		color: "red"
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
			onClicked: console.log("wifi Icon")
			
			Wifi{
				id: wifiIcon
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
			onClicked: console.log("R wifi Icon")
			
			RightIcon{
				id: rightIcon
			}
		}
		
	}
}

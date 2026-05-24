import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Core

Rectangle{
	id: root

	property real fSize: 0
	property alias titleIcon: icon.text 
	property alias titleText: text.text
	
	opacity: 0.85
	color: Colors.primary_container
				
	Row{
		spacing: 28

		anchors{
			left: parent.left
			right: parent.right
			verticalCenter: parent.verticalCenter
			rightMargin: 16
			leftMargin: 16
		}

		Text{
			id:icon
			font.pixelSize: root.fSize * 0.0115
			font.family: FontAndSizeRule.fontFamily
			color: Colors.on_primary_container
			anchors.verticalCenter: parent.verticalCenter

			text: root.titleIcon 
		}
					
		Text{
			id:text
			font.pixelSize: root.fSize * 0.0065
			font.family: FontAndSizeRule.fontFamily
			color: Colors.on_primary_container
			anchors.verticalCenter: parent.verticalCenter

			text: root.titleText
		}
	}
}

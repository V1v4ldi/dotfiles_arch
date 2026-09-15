import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Core

Rectangle{
	id:root
	color: active ? Colors.primary_container : "transparent"

	property alias text:text.text
	property alias icon:icon.text
	property bool active: false
	property int layoutHeight: 0
	property var clickFun: ""

	implicitHeight: root.layoutHeight	
	anchors.leftMargin: 16
	anchors.rightMargin: 16
	radius: 16
	
	Row{
		leftPadding: 24
		spacing: 20

		anchors{
			left: parent.left
			right: parent.right
			verticalCenter: parent.verticalCenter
			rightMargin: 16
			leftMargin: 16
		}

		Text{
			id:icon
			anchors.verticalCenter: parent.verticalCenter
			font.pixelSize: Quickshell.screens[0].width * 0.0115
			font.family: FontAndSizeRule.fontFamily				
			color: Colors.on_primary_container
	
			text: root.icon
		}

		Text{
			id:text
			anchors.verticalCenter: parent.verticalCenter
			font.pixelSize: Quickshell.screens[0].width * 0.0075
			font.family: FontAndSizeRule.fontFamily				
			color: Colors.on_primary_container
	
			text: root.text
		}
	}
	MouseArea{
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
		onClicked: root.clickFun()
	}
}

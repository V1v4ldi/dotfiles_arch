import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Core

Rectangle{
	id:root
	color: Colors.primary_container
	Layout.fillWidth: true

	property alias text:text.text
	property var clickFun: ""
					
	Text{
		id:text
		rightPadding: 16
		leftPadding: 16
		anchors.verticalCenter: parent.verticalCenter
		font.pixelSize: Quickshell.screens[0].width * 0.0065
		font.family: FontAndSizeRule.fontFamily				
		color: Colors.on_primary_container
	
		text: root.text
	}
	MouseArea{
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
		onClicked: root.clickFun()
	}
}

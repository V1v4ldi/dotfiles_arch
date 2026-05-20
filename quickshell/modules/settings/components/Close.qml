import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core

Rectangle{
	id: closeArea
				
	implicitHeight: 42
	topRightRadius: 16
	topLeftRadius: 16
	border.pixelAligned: true
	border.color: Colors.outline
	color: "transparent"

	Rectangle{
		implicitWidth: 20
		implicitHeight: 20
		radius: implicitWidth / 2
		anchors.rightMargin: 16
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter
		color: Colors.error

		Text{
			anchors.left: parent.left
			anchors.centerIn: parent
			font.family: FontAndSizeRule.fontFamily
			font.pixelSize: FontAndSizeRule.fontSize - 3
			color: Colors.on_error

			text: Icons.close
		}

		MouseArea{
			anchors.fill: parent
			enabled: root.enabled
			cursorShape: Qt.PointingHandCursor
			onClicked: root.close()
		}
	}

	Rectangle{
		implicitWidth: titleText.width + 8	
		implicitHeight: parent.height
		radius: 10
		anchors.leftMargin: 8
		anchors.left: parent.left
		color: "transparent"

		Text{
			id: titleText
			anchors.centerIn: parent
			font.family: FontAndSizeRule.fontFamily
			font.pixelSize: FontAndSizeRule.fontSize
			color: Colors.on_background

			text: "Settings"
		}
	}
				
}

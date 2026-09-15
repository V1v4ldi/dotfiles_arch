import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.Widgets.settings

Item{
	id: closeArea
				
	TitleWidget{
		id:settingsTitle
		width: parent.width / 4
		height: parent.height
		anchors.leftMargin:0
		anchors.rightMargin:0
		radius: 0
		icon: Icons.setting
		text: "Settings"
		color: Qt.alpha(Colors.on_background, 0.05)
	}
	
	Rectangle{
		implicitWidth: 20
		implicitHeight: 20
		radius: implicitWidth / 2
		anchors.rightMargin: 32
		anchors.right: parent.right
		anchors.verticalCenter: parent.verticalCenter
		color: Colors.error

		Text{
			anchors.left: parent.left
			anchors.centerIn: parent
			font.family: FontAndSizeRule.fontFamily
			font.pixelSize: closeArea.implicitHeight * 0.25
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
}

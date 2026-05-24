import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

Row{
	id:root
	spacing: 4

	property alias icon: audioIcon.text
	property alias text: audioText.text
	property alias visibility: audioText.visible

	Text{
		id:audioIcon
		anchors.verticalCenter: parent.verticalCenter

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize
		color: Colors.on_background
		text: root.text
	}
			
	Text {
		id:audioText
		visible: root.visibility
		anchors.verticalCenter: parent.verticalCenter

		leftPadding:3
		text: root.text 
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background
	}
}

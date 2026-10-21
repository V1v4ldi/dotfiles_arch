import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import quickshell

RowLayout{	
	id:root

	property string mode: ""
	property string icon: ""
	property string text: ""
	property color bgColor: "transparent"

	spacing: 4

	Text{
		id:blockIcon
		visible: (root.mode === "both" || root.mode === "icon") ?? false
		Layout.alignment: Qt.AlignVCenter
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize
		color: root.bgColor

		text: root.icon
	}
			
	Text {
		id:blockText
		visible: (root.mode === "both" || root.mode === "text") ?? false
		leftPadding:3 * FontAndSizeRule.scaleFactor
		Layout.alignment: Qt.AlignVCenter
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: root.bgColor

		text: root.text
	}

}

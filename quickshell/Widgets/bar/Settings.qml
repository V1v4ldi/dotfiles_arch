import qs.Core
import QtQuick
import Quickshell

Text{
	id:textArea
	anchors.leftMargin: 16

	font.family: FontAndSizeRule.fontFamily
	font.pixelSize: FontAndSizeRule.iconSize - 3
	color: Colors.on_background
	text: Icons.setting
}

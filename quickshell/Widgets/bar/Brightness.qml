import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.Core
import qs.services

RowLayout{
	id: BrightWid
	anchors.centerIn: parent
	spacing: 2
	
	Text{
		id: BrightIcon
		
		leftPadding:10
		font.family: fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: "white"
		text: {}
	}
}

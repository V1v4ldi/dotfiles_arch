import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core

Rectangle{
	id:root

	Text{
		font.family:FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize * 2
		color: Colors.on_primary_container
		text: "Bluetooth"
	}

	Rectangle{
		width: parent.width
		height: 50
		color: Qt.alpha("white", 0.8)
	}
}

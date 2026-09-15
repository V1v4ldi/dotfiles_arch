import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.components.settings.subSettings

Item{
	id:root
	
	ColumnLayout{
		spacing: 5
		anchors{
			left: parent.left
			right: parent.right
		}

		Text{
			font.family:FontAndSizeRule.fontFamily
			font.pixelSize: FontAndSizeRule.fontSize * 2
			color: Colors.on_primary_container
			text: "Connection"
		}

		Bluetooth{}
	}
}

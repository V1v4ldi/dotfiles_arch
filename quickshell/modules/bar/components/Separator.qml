import Quickshell
import QtQuick
import qs.Core

Item {
	property string type: "dot"
	implicitHeight: parent.height
	implicitWidth: separatorText.implicitWidth

	Text {
		id: separatorText
		anchors.centerIn: parent
		
		text: {
			if (type == "dot") return ""
			if (type == "line") return "|"
			if (type == "dot-line") return ""
			if (type == "blank2") return "  "
			if (type == "blank3") return "   "
			return " "
		}
		color: "#585b70"
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		font.bold: true
	}
}

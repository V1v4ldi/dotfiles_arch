import qs.Core
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services as Service

RowLayout {
	id: tempRow
	spacing: 8
	anchors.centerIn: parent

	Text{
		id:tempIcon
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize
		color: Colors.on_background
		text: {
			Service.SystemUsage.temp <= 40 ? Icons.lowTemp :
			Service.SystemUsage.temp <= 60 ? Icons.medTemp : Icons.highTemp 
		}
	}

	Text{
		id:tempVal
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background
		text: Service.SystemUsage.temp + "°C"
	}
}

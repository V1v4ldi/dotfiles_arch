import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

ColumnLayout{
	id: root

	Text{
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize + 3
		color: "white"

		text: {
			if(Service.SystemUsage.whoami != "") return Service.SystemUsage.whoami + "\n" + "on Katana A15"
			else return ""
		}
	}

	Text{
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize + 3
		color: "white"

		text:{
			if (Service.SystemUsage.uptimeHour > 0) return "Uptime: " + Service.SystemUsage.uptimeHour + "h " + Service.SystemUsage.uptimeMinute + "m"
			if (Service.SystemUsage.uptimeMinute > 0) return "Uptime: " + "0h " + Service.SystemUsage.uptimeMinute + "m"
			else return "Uptime: 0h 0m"
		}
	}
}

import qs.Core
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services as Service

Row{
	id:battRow
	spacing: 8
	
	Text{
		id:battIcon

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize - 2
		color: Colors.on_background
		
		text: {
			if (Service.SystemUsage.isCharging == 3) return Icons.chargedBattery;
			if (Service.SystemUsage.isCharging == 2) return Icons.pluggedBattery;
			if (Service.SystemUsage.isCharging == 4) return Icons.battery100;			
			if (Service.SystemUsage.batt >= 90) return Icons.battery100;
			if (Service.SystemUsage.batt >= 80) return Icons.battery90;
			if (Service.SystemUsage.batt >= 70) return Icons.battery80;
			if (Service.SystemUsage.batt >= 60) return Icons.battery70;
			if (Service.SystemUsage.batt >= 50) return Icons.battery60;
			if (Service.SystemUsage.batt >= 40) return Icons.battery50;
			if (Service.SystemUsage.batt >= 30) return Icons.battery40;
			if (Service.SystemUsage.batt >= 20) return Icons.battery30;
			return Icons.batteryWarning;		
		}
	}

	Text{
		id:battVal
		anchors.verticalCenter: parent.verticalCenter

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background

		text: {Service.SystemUsage.isCharging == 4 ? "Full" : Math.round(Service.SystemUsage.batt) + "%"}
		}
	}

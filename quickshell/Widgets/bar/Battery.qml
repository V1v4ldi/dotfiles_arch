import quickshell
import Quickshell
import QtQuick
import QtQuick.Layouts

Row{
	id:battRow
	spacing: 8
	
	Text{
		id:battIcon

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize - 2
		color: Colors.on_background
		
		text: {
			if (SystemUsage.isCharging == 3) return Icons.chargedBattery;
			if (SystemUsage.isCharging == 2) return Icons.pluggedBattery;
			if (SystemUsage.isCharging == 4) return Icons.battery100;			
			if (SystemUsage.batt >= 90) return Icons.battery100;
			if (SystemUsage.batt >= 80) return Icons.battery90;
			if (SystemUsage.batt >= 70) return Icons.battery80;
			if (SystemUsage.batt >= 60) return Icons.battery70;
			if (SystemUsage.batt >= 50) return Icons.battery60;
			if (SystemUsage.batt >= 40) return Icons.battery50;
			if (SystemUsage.batt >= 30) return Icons.battery40;
			if (SystemUsage.batt >= 20) return Icons.battery30;
			return Icons.batteryWarning;		
		}
	}

	Text{
		id:battVal
		anchors.verticalCenter: parent.verticalCenter

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background

		text: {SystemUsage.isCharging == 4 ? "Full" : Math.round(SystemUsage.batt) + "%"}
	}
}

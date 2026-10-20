import QtQuick
import QtQuick.Layouts
import Quickshell
import quickshell

ColumnLayout{
	id:root
	spacing: 15
	width: parent.width
	property color bgColor: "transparent" 
	
	Rectangle{
		id: profile
		color: root.bgColor
		Layout.fillWidth: true
		height: profileRow.height + 40
		radius: 10

		RowLayout{
			id: profileRow
			spacing: 20
			anchors.verticalCenter: parent.verticalCenter
			ProfileWid{
				Layout.preferredWidth: 128
				Layout.preferredHeight: 128
				Layout.leftMargin: 15
			}
			UptimeWid{
				Layout.leftMargin: 15
			}
		}
	}
	
	Rectangle{
		id: usage
		color: root.bgColor
		Layout.fillWidth: true
		height: usageRow.height + 20
		radius: 10

		RowLayout{
			id: usageRow
			spacing: 15
			anchors.centerIn: parent

			UsageWid{
				id: cpu
				usageIcon: Icons.cpuIcon
				circleUsage: SystemUsage.cpuUsage * 3.6
				textUsage: "Cpu: " + SystemUsage.cpuUsage + "%"
			}
			UsageWid{
				id: ram
				usageIcon: Icons.ramIcon
				circleUsage: SystemUsage.ramUsage * 3.6
				textUsage: "Ram: " + SystemUsage.ramUsage + "%"
			}
			UsageWid{
				id: disk
				usageIcon: Icons.diskIcon
				circleUsage: SystemUsage.diskUsage * 3.6
				textUsage: "Disk: " + SystemUsage.diskUsage + "%"
			}
		}
	}
}

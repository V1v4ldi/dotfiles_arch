import qs.Core
import qs.Widgets.controlCenter
import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service

ColumnLayout{
	id:root
	spacing: 15
	width: parent.width
	
	Rectangle{
		id: profile
		color: Qt.alpha(Colors.on_primary, 0.4)
		Layout.fillWidth: true
		height: profileRow.height + 40
		radius: 10
		border.color: Colors.outline
		border.width: 2

		RowLayout{
			id: profileRow
			spacing: 20
			anchors.verticalCenter: parent.verticalCenter
			Profile{
				Layout.preferredWidth: 128
				Layout.preferredHeight:128
				Layout.leftMargin: 15
			}
			Uptime{
				Layout.leftMargin: 15
			}
		}
	}
	
	Rectangle{
		id: usage
		color: Qt.alpha(Colors.on_primary, 0.4)
		Layout.fillWidth: true
		height: usageRow.height + 20
		radius: 10
		border.color: Colors.outline
		border.width: 2

		RowLayout{
			id: usageRow
			spacing: 15
			anchors.centerIn: parent

			Usage{
				id: cpu
				usageIcon: Icons.cpuIcon
				circleUsage: Service.SystemUsage.cpuUsage * 3.6
				textUsage: "Cpu: " + Service.SystemUsage.cpuUsage + "%"
			}
			Usage{
				id: ram
				usageIcon: Icons.ramIcon
				circleUsage: Service.SystemUsage.ramUsage * 3.6
				textUsage: "Ram: " + Service.SystemUsage.ramUsage + "%"
			}
			Usage{
				id: disk
				usageIcon: Icons.diskIcon
				circleUsage: Service.SystemUsage.diskUsage * 3.6
				textUsage: "Disk: " + Service.SystemUsage.diskUsage + "%"
			}
		}
	}
}

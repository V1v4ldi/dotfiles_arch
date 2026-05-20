import qs.Core
import qs.Widgets.controlCenter
import QtQuick
import QtQuick.Layouts
import Quickshell

ColumnLayout{
	id:root
	spacing: 15
	width: parent.width
	
	Rectangle{
		id: profile
		color: "transparent"
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
		color: "transparent"
		Layout.fillWidth: true
		height: usageRow.height + 20
		radius: 10
		border.color: Colors.outline
		border.width: 2

		RowLayout{
			id: usageRow
			spacing: 15
			anchors.centerIn: parent

			Cpu{}
			Ram{}
			Disk{}
		}
	}
}

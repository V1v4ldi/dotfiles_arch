import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.Widgets.settings

Rectangle{
	id: root

	property int layoutHeight: 0

	bottomLeftRadius: 16
	border.color: Colors.outline
	border.pixelAligned: true

	Flickable{
		id: flickable
		anchors.fill: parent
		boundsBehavior: Flickable.StopAtBounds

		ColumnLayout{
			spacing: 10

			anchors{
				left: parent.left
				right: parent.right
				leftMargin: 1
				rightMargin: 1
				topMargin: 1
				bottomMargin: 1
			}

			TitleWidget{
				id: bluetooth
				fSize: Quickshell.screens[0].width
				titleIcon: Icons.btConnect
				titleText: "Bluetooth"
				Layout.preferredHeight: root.layoutHeight
				Layout.fillWidth: true
				
				MouseArea{
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: console.log("test")
				}
			}

			TitleWidget{
				id: wifi
				fSize: Quickshell.screens[0].width
				titleIcon: Icons.wifiFull
				titleText: "Wifi"
				Layout.preferredHeight: root.layoutHeight
				Layout.fillWidth: true
				
				MouseArea{
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: console.log("test")
				}
			}

			TitleWidget{
				id: display
				fSize: Quickshell.screens[0].width
				titleIcon: Icons.displayIcon
				titleText: "Display Settings"
				Layout.preferredHeight: root.layoutHeight
				Layout.fillWidth: true
				
				MouseArea{
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: console.log("test")
				}
			}
		}
	}
}

import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core

Rectangle{
	id: title
	bottomLeftRadius: 16
	border.color: Colors.outline
	border.pixelAligned: true

	Flickable{
		id: flickable
		anchors.fill: parent
		boundsBehavior: Flickable.StopAtBounds

		ColumnLayout{
			anchors{
				fill: parent
				bottomMargin: 20
				topMargin: 20
			}
			spacing: 10
			Layout.alignment: Qt.AlignVCenter

			Rectangle{
				id: bluetooth
				opacity: 0.85
				Layout.fillWidth: true
				Layout.preferredHeight: 30
				Layout.alignment: Qt.AlignVCenter

				color: Colors.primary_container
				
				RowLayout{
					spacing: 8
					Text{	
						rightPadding: 8
						leftPadding: 8
						font.pixelSize:FontAndSizeRule.iconSize
						font.family: FontAndSizeRule.fontFamily
						color: Colors.on_primary_container

						text: Icons.btConnect
					}
					
					Text{	
						rightPadding: 8
						leftPadding: 8
						font.pixelSize:FontAndSizeRule.fontSize
						font.family: FontAndSizeRule.fontFamily
						color: Colors.on_primary_container

						text: "Bluetooth"
					}
				}
				MouseArea{
					anchors.fill: parent
					cursorShape: Qt.PointingHandCursor
					onClicked: console.log("test")
				}
			}
		}
	}
}

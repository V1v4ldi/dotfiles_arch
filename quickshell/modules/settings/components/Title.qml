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

			Item{
				id: connectionDD
				Layout.fillWidth: true
				Layout.preferredHeight: connectionCol.implicitHeight
				
				property bool dd1: false

				ColumnLayout{
					id:connectionCol
					spacing: 10
					anchors.fill: parent

					TitleWidget{
						id:connection
						Layout.preferredHeight: root.layoutHeight
						text: "Connection"

						clickFun: function() {
							connectionDD.dd1 = !connectionDD.dd1
						}
					}
					
					SubTitleWidget{
						id: bluetooth
						visible: connectionDD.dd1
						titleIcon: Icons.btConnect
						titleText: "Bluetooth"
						Layout.preferredHeight: root.layoutHeight
						
						clickFun: function() {console.log("tes2")}
					}

					SubTitleWidget{
						id: wifi
						visible: connectionDD.dd1
						titleIcon: Icons.wifiFull
						titleText: "Wifi"
						Layout.preferredHeight: root.layoutHeight
				
						clickFun: function() {console.log("tes2")}
					}
				}


			}

			

			SubTitleWidget{
				id: display
				titleIcon: Icons.displayIcon
				titleText: "Display Settings"
				Layout.preferredHeight: root.layoutHeight
				
				clickFun: function() {console.log("tes2")}
			}

			SubTitleWidget{
				id: theme
				titleIcon: Icons.themeIcon
				titleText: "Theme Settings"
				Layout.preferredHeight: root.layoutHeight
				
				clickFun: function() {console.log("tes2")}
			}
		}
	}
}

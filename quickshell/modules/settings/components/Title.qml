import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.Widgets.settings

Rectangle{
	id: root

	property int layoutHeight: 0
	property string dd1: ""

	bottomLeftRadius: 16
	border.color: Colors.outline
	border.pixelAligned: true

	Flickable{
		id: flickable
		anchors.fill: parent
		boundsBehavior: Flickable.StopAtBounds
		contentHeight: Column.height + 30

		Column{
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
				id:connection
				anchors.left: parent.left
				anchors.right: parent.right
				layoutHeight: root.layoutHeight
				icon: Icons.connection
				text: "Connection"

				clickFun: function() {
					if(root.dd1 != "conn"){
						root.dd1 = "conn"
					} else {
						root.dd1 = ""
					}
				}
			}

			SubTitleWidget{
				id: bluetooth
				titleIcon: Icons.btConnect
				titleText: "Bluetooth"
				implicitHeight: root.dd1 == "conn" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
				
				clickFun: function() {console.log("tes2")}
			}

			SubTitleWidget{
				id: wifi
				titleIcon: Icons.wifiFull
				titleText: "Wifi"
				implicitHeight: root.dd1 == "conn" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
		
				clickFun: function() {console.log("tes2")}
			}
				
				
			TitleWidget{
				id:personalization
				anchors.left: parent.left
				anchors.right: parent.right
				layoutHeight: root.layoutHeight	
				icon: Icons.user
				text: "Personalization"

				clickFun: function() {	

					if(root.dd1 != "personal"){
						root.dd1 = "personal"
					} else {
						root.dd1 = ""
					}
				}
			}

			SubTitleWidget{
				id: display
				titleIcon: Icons.displayIcon
				titleText: "Display Settings"
				implicitHeight: root.dd1 == "personal" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
		
				clickFun: function() {console.log("tes2")}
			}

			SubTitleWidget{
				id: theme
				titleIcon: Icons.themeIcon
				titleText: "Theme Settings"
				implicitHeight: root.dd1 == "personal" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
		
				clickFun: function() {console.log("tes2")}
			}
		}
	}
}

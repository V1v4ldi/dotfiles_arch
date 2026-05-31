import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.Widgets.settings

Rectangle{
	id: root

	property int layoutHeight: 0
	property string dd1: ""
	property string page: ""

	bottomLeftRadius: 16

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
				active: root.dd1 == "conn" ?? false

				clickFun: function() {
					if(root.dd1 != "conn"){
						root.dd1 = "conn"
					} else {
						root.dd1 = ""
						root.page = ""
					}
				}
			}

			SubTitleWidget{
				id: bluetooth
				titleIcon: Icons.btConnect
				titleText: "Bluetooth"
				implicitHeight: root.dd1 == "conn" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
				active: root.page == "bt" ?? false
				
				clickFun: function() {root.page == "bt" ? root.page = "" : root.page = "bt"}
			}

			SubTitleWidget{
				id: wifi
				titleIcon: Icons.wifiFull
				titleText: "Wifi"
				implicitHeight: root.dd1 == "conn" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
				active: root.page == "wf" ?? false
		
				clickFun: function() {root.page == "wf" ? root.page = "" : root.page = "wf"}
			}
				
				
			TitleWidget{
				id:personalization
				anchors.left: parent.left
				anchors.right: parent.right
				layoutHeight: root.layoutHeight	
				icon: Icons.user
				text: "Personalization"
				active: root.dd1 == "personal" ?? false

				clickFun: function() {	
					if(root.dd1 != "personal"){
						root.dd1 = "personal"
					} else {
						root.dd1 = ""
						root.page = ""
					}
				}
			}

			SubTitleWidget{
				id: display
				titleIcon: Icons.displayIcon
				titleText: "Display Settings"
				implicitHeight: root.dd1 == "personal" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
				active: root.page == "display" ?? false
		
				clickFun: function() {root.page == "display" ? root.page = "" : root.page = "display"}
			}

			SubTitleWidget{
				id: theme
				titleIcon: Icons.themeIcon
				titleText: "Theme Settings"
				implicitHeight: root.dd1 == "personal" ? root.layoutHeight : 0
				implicitWidth: parent.implicitWidth
				active: root.page == "theme" ?? false
		
				clickFun: function() {root.page == "theme" ? root.page = "" : root.page = "theme"}
			}
		}
	}
}

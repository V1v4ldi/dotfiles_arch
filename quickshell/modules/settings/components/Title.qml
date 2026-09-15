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
		anchors.topMargin: 8
		boundsBehavior: Flickable.StopAtBounds
		contentHeight: Column.height + 30
		clip:true

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
					}
				}
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
					}
				}
			}
		}
	}
}

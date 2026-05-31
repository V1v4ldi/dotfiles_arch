import Quickshell
import QtQuick
import qs.components.settings

Rectangle{
	id:root
	property string page: ""
	property int margin: root.width * 0.065
	Loader{
		id: bluetooth
		active: root.page == "bt" ?? false
		anchors.fill: parent
		sourceComponent: Bluetooth{
			id: bt	
			
			anchors{
				left: parent.left
				right: parent.right
				leftMargin: root.margin
				rightMargin: root.margin
			}
		}
	}
	Loader{
		id: wifi
		active: root.page == "wf" ?? false
		anchors.fill: parent
		sourceComponent: Wifi{
			id: wf

			anchors{
				left: parent.left
				right: parent.right
				leftMargin: root.margin
				rightMargin: root.margin
			}
		}
	}
	Loader{
		id: display
		active: root.page == "display" ?? false
		anchors.fill: parent
		sourceComponent: Display{
			id: display

			anchors{
				left: parent.left
				right: parent.right
				leftMargin: root.margin
				rightMargin: root.margin
			}
		}
	}
	Loader{
		id: theme
		active: root.page == "theme" ?? false
		anchors.fill: parent
		sourceComponent: Theme{
			id: theme
			anchors{
				left: parent.left
				right: parent.right
				leftMargin: root.margin
				rightMargin: root.margin
			}
		}
	}
}

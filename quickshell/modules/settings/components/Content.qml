import Quickshell
import QtQuick
import qs.components.settings

Rectangle{
	id:root
	property string dd1: ""
	property int margin: root.width * 0.065
	
	Loader{
		id: connection 
		active: root.dd1 == "conn" ?? false
		anchors.fill: parent
		sourceComponent: Connection{
			id: bt	
			
			anchors{
				fill: parent
				leftMargin: root.margin
				rightMargin: root.margin
				bottomMargin: root.margin * 0.1
			}
		}
	}

	Loader{
		id: personal
		active: root.dd1 == "personal" ?? false
		anchors.fill: parent
		sourceComponent: Personalization{
			id: theme

			anchors{
				fill: parent
				leftMargin: root.margin
				rightMargin: root.margin
				bottomMargin: root.margin * 0.1
			}
		}
	}
}

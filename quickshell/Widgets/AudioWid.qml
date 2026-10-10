import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import quickshell

/* This Widget Can Be Used For Speaker And Mic */

Item{
	id: root

	property string mode: "compact"
	property string icon: ""
	property string text: ""
	property bool visibility: false

	implicitWidth: audioLoader.item ? audioLoader.item.implicitWidth : 0
	implicitHeight: audioLoader.item ? audioLoader.item.implicitHeight : 0

/* This is Top Bar Audio Component */
	Component{
		id: topBarComponent

		RowLayout{
			id:topBarRoot
			spacing: 4

			Text{
				id:audioIcon
				Layout.alignment: Qt.AlignVCenter
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.iconSize
				color: Colors.on_background

				text: root.icon
			}
					
			Text {
				id:audioText
				visible: root.visibility	
				leftPadding:3
				Layout.alignment: Qt.AlignVCenter
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.fontSize
				color: Colors.on_background
 
				text: root.text
			}

		}

		
	}

/* This is Side Panel Audio Component */
	Component{
		id: panelComponent

		RowLayout{
			id:panelRoot
			spacing: 4

			Text{
				id:audioPanelIcon
				Layout.alignment: Qt.AlignVCenter

				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.iconSize
				color: Colors.on_background
				text: root.icon
			}
					
			Text {
				id:audioPanelText
				visible: root.visibility
				Layout.alignment: Qt.AlignVCenter

				leftPadding:3
				text: root.text 
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.fontSize
				color: Colors.on_background
			}

		}

		
	}



	Loader{
		id: audioLoader
		sourceComponent: root.mode === "compact" ? topBarComponent : null
	}

}

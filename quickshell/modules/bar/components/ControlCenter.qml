import QtQuick
import Quickshell
import qs.Core
import qs.Widgets.bar

Item{
	id: notifRoot
	width: cc.width
	height: cc.height
	anchors.verticalCenter: parent.verticalCenter
	
	ControlCenter{
		id:cc
	}

	MouseArea{
		cursorShape: Qt.PointingHandCursor
		anchors.fill: parent

		
		onClicked: {
			ccIpc.openCC()
		}
	}	
}

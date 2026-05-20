import QtQuick.Controls
import QtQuick
import Quickshell
import qs.Widgets.bar

Item{
	id:root
	width: settings.width
	height: settings.height
	anchors.verticalCenter: parent.verticalCenter
	
	Settings{
		id:settings
	}

	MouseArea{
		id:iconArea
		cursorShape: Qt.PointingHandCursor
		anchors.fill: parent
		
		onClicked: settingsIpc.openSettings()
	
	}
}

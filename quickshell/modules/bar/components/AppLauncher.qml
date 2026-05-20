import Quickshell
import QtQuick
import qs.Widgets.bar

Item{
	id:root
	width: appLaunch.width
	height: appLaunch.height

	AppLauncher{id: appLaunch}

	MouseArea{
		id: appLaunchMouse
		anchors.fill: parent
		cursorShape: Qt.PointingHandCursor
	}
}

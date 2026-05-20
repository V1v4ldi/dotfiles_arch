import Quickshell
import QtQuick
import qs.services as Service
import qs.Widgets.bar

Item{
	id:battArea
	height: battery.height 
	width: battery.width
	anchors.verticalCenter: parent.verticalCenter

	Battery{id:battery}

	MouseArea{
		id:battAreaButton

		cursorShape: Qt.PointingHandCursor
		hoverEnabled: true
		anchors.fill: parent
	}
}

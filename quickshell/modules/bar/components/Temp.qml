import QtQuick
import Quickshell
import qs.Widgets.bar

Item{
	id:root
	width:temp.width
	height:temp.height

	Temp{id:temp}

	MouseArea{
		id:rootArea
	}
}

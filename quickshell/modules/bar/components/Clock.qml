import qs.Widgets.bar
import QtQuick
import Quickshell

Item{
	id:root

	width: clock.width
	height: clock.height

	Clock{
		id:clock
	}
}

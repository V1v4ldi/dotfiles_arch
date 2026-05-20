import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core

Row{
	id: root
	spacing: 3

	SystemClock{
		id: clock
		precision: SystemClock.Seconds
	}

	Text {
		rightPadding: 14
		text: Icons.clock + " " + Qt.formatDateTime(clock.date, "hh:mm:ss") 
		color: Colors.on_background
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
	}
}

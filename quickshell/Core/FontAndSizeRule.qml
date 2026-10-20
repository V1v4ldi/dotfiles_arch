pragma Singleton
import QtQuick
import Quickshell

QtObject{
	readonly property real scaleFactor: Quickshell.screens > 0 ? (Quickshell.screen.height / 1440) : 1.0

	readonly property string fontFamily: "JetBrainsMono Nerd Font"
	readonly property int iconSize: 20 * scaleFactor
	readonly property int fontSize: 14 * scaleFactor

	readonly property int iconSysSize: 25 * scaleFactor

	readonly property int sysUsageBorderSize: 120 * scaleFactor
	readonly property int sysUsageCircularSize: 80 * scaleFactor
}

import QtQuick
pragma Singleton

// Just An Icon That Can Be Used By Widgets Or Components

QtObject {
	readonly property string wifiLow: "󰤟"
	readonly property string wifiMed: "󰤢"
	readonly property string wifiHigh: "󰤥"
	readonly property string wifiFull: "󰤨"
	readonly property string wifiDisconnect: "󰤭"
	
	readonly property string ethernetDisconnect: "󰈂"
	readonly property string ethernetConnect: "󰈁"

	readonly property string btConnect: ""
	readonly property string btDisconnect: "󰂲"
	
	readonly property string brightLow: "󰃝"
	readonly property string brightMed: "󰃟"
	readonly property string brightHigh: "󰃠"
	
	readonly property string batteryWarning:  "󱃍"
	readonly property string battery10:  "󰁺"
	readonly property string battery20:  "󰁻"
	readonly property string battery30:  "󰁼"
	readonly property string battery40:  "󰁽"
	readonly property string battery50:  "󰁾"
	readonly property string battery60:  "󰁿"
	readonly property string battery70:  "󰂀"
	readonly property string battery80:  "󰂁"
	readonly property string battery90:  "󰂂"
	readonly property string battery100: "󰁹"
	
	readonly property string chargedBattery: "󱐋"
	readonly property string pluggedBattery: ""
	
	readonly property string lock: ""
	readonly property string shutdown: ""
	readonly property string restart: ""
	readonly property string suspend: "󰤄"
	readonly property string logout: "󰍃"
	
	readonly property string dnd: "󰂠"
	readonly property string bell: ""
	readonly property string setting: ""
	readonly property string arch: ""
	readonly property string clock: ""

	readonly property string back: ""
	readonly property string next: ""
	readonly property string right: ""
	readonly property string close: ""
	
	readonly property string lowTemp: "󰜗"
	readonly property string medTemp: "󱩅"
	readonly property string highTemp: "󰈸"
	
	readonly property string musicNext: "󰼧"
	readonly property string musicPause: ""
	readonly property string musicPlay: ""
	readonly property string musicPrev: "󰼨"
	
	readonly property string mute: "󰝟"
	readonly property string volumeLow: "󰕿"
	readonly property string volumeMed: "󰖀"
	readonly property string volumeHigh: "󰕾"
	
	readonly property string micMute: "󰍭"
	readonly property string mic: "󰍬"

	readonly property var wsIcons: ["一", "二", "三", "四", "五", "六", "七"]
	readonly property string wsIcons2: ["", ""]

	readonly property string cpuIcon: ""
	readonly property string ramIcon: ""
	readonly property string diskIcon: "󰋊"
}

pragma Singleton
import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
	id: network

	property string ssid: ""
	property string password: ""

	property var defaultNetwork: Networking.devices
	property var devices: defaultNetwork.values
	property bool wifiEnabled: Networking.wifiEnabled
	
	property var wiredType: devices.find(d => d.type == DeviceType.Wired)
	property var wired: wiredType ? wiredType.networks.values : null

	property var wifiType: devices.find(d => d.type == DeviceType.Wifi)
	property var wifi: wifiType ? wifiType.networks.values : null //Wifi List

	property var connectedWifi: wifi.find(d => d.connected)
	property string wifiName: connectedWifi ? connectedWifi.name : null
}

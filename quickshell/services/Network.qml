pragma Singleton
import Quickshell
import Quickshell.Networking
import QtQuick

Singleton {
	id: network

	property string ssid: ""
	property string password: ""

	property NetworkDevice networkDevice: null
	
	property NetworkDevice wifi: null
	property NetworkDevice ethernet: null
	
	property bool wifiEnabled: Networking.wifiEnabled

	property var wifiList: wifi ? wifi.networks : []
	property var wiredList: ethernet ? ethernet.networks : []



	function updateVar() {
		for(var i = 0; i < Networking.devices.values.length; i++){
			var dev = Networking.devices.values[i]
			if(dev.type === DeviceType.Wifi){
				wifi = dev;
			}

			if(dev.type === DeviceType.Wired){
				ethernet = dev;
			}
		}
	}

	Component.onCompleted: updateVar()

	Connections{
		target: Networking.devices
		function onValuesChanged(){
			network.updateVar()
		}
	}

}
/* 

 
	onIsWifiEnabledChanged: {
		if(!isWifiEnabled){
			isScanning = false
		}
	}

	onIsScanningChanged: {
		if (isWifiEnabled) {
			WifiDevice.scannerEnabled = isScanning
		} else {
			isScanning = false
		}
	}

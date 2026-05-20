import Quickshell
import QtQuick
import Quickshell.Services.UPower

QtObject{
	id: battService
	property int deviceState: UPower.displayDevice.state
	property int battStatus: getBattStatus()
	property int battPercentage: UPower.displayDevice.percentage * 100
	property real timeToEmpty: UPower.displayDevice.timeToEmpty
	property real timeToFull: UPower.displayDevice.timeToFull

	onDeviceStateChanged: battStatus = getBattStatus()
	

	function getBattStatus() {
		if (deviceState === UPowerDeviceState.PendingCharge) return 2
		if (deviceState === UPowerDeviceState.Charging) return 3
		if (deviceState === UPowerDeviceState.FullyCharged) return 4
		return 1
	}
}

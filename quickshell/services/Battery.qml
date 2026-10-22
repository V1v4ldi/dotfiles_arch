pragma Singleton
import Quickshell
import QtQuick
import Quickshell.Services.UPower

Singleton{
	id: battService
	readonly property var displayDevice: UPower.displayDevice
	property int deviceState: displayDevice.state
	property int battPercentage: displayDevice.percentage * 100 
	property real timeToEmpty: displayDevice.timeToEmpty
	property real timeToFull: displayDevice.timeToFull
	property real health: displayDevice.healthPercentage
	property int battStatus: getBattStatus()

	onDeviceStateChanged: battStatus = getBattStatus()

	function getBattStatus() {
		if (deviceState === UPowerDeviceState.PendingCharge) return 2
		if (deviceState === UPowerDeviceState.Charging) return 3
		if (deviceState === UPowerDeviceState.FullyCharged) return 4
		return 1
	}
}

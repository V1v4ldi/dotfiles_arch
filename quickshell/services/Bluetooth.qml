pragma Singleton
import Quickshell
import Quickshell.Bluetooth
import QtQuick

Singleton {
    id: root
    readonly property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter
    readonly property list<BluetoothDevice> devices: defaultAdapter?.devices?.values ?? []
	readonly property BluetoothDevice activeDevice: devices.find(d => d.connected) ?? null
	readonly property bool bluetoothEnabled: defaultAdapter?.enabled ?? false
}

pragma Singleton
import quickshell
import Quickshell
import Quickshell.Io
import QtQuick

Singleton{
	id:root
	readonly property int max_brightness: 65535
	property int current_brightness: 0
	property int current_brightness_perc: 0
	property string brightness_path: "/sys/class/backlight/amdgpu_bl2"

	FileView{
		id:brightness
		path: root.brightness_path + "/brightness"
		watchChanges: true

		onLoaded:{
			let val = parseInt(text().trim())
			if(!isNaN(val)){
				root.current_brightness = val
				root.current_brightness_perc = Math.round((root.current_brightness / root.max_brightness) * 100)
			}
		}
		
		onFileChanged: {
			brightness.reload()
		}
	}

	function setBrightness(val){
		let proc = Qt.createQmlObject('import Quickshell.Io; Process{}', root)
		proc.command = ["brightnessctl", "set", val + "%"]
		proc.running = true
	}
}

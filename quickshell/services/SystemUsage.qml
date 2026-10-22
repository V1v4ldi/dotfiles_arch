pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import quickshell

Singleton{
	id:root

	readonly property string whoami: Quickshell.env("USER")
	property int ramUsage: 0
	property int cpuUsage: 0
	property int diskUsage: 0
	property int temp: 0
	property int uptimeHour: 0
	property int uptimeMinute: 0
	property real prevTotal:0
	property real prevIdle:0

	property real batt: Battery.battPercentage
	property int isCharging: Battery.battStatus
	property real battTTF: Battery.timeToFull
	property real battTTE: Battery.timeToEmpty
	property real battHealth: Battery.health

	FileView{
		id: cpuView
		path: "/proc/stat"

		onLoaded: {
			const m = /^cpu\s+(.*)$/m.exec(this.text())
			if (!m) return
			const v = m[1].trim().split(/\s+/).map(Number)
			const idle = v[3] + (v[4] ?? 0)
			const total = v.reduce((a,b) => a + b, 0 )
			if(root.prevTotal > 0){
				const d = total - root.prevTotal
				root.cpuUsage = d > 0
				? Math.round(100 * (1 - (idle - root.prevIdle) / d )) : 0
			}
			root.prevIdle = idle
			root.prevTotal = total
		}

	}

	FileView{
		id: ramView
		path: "/proc/meminfo"

		onLoaded:{
			const t = /MemTotal:\s*(\d+)/.exec(this.text())
			const a = /MemAvailable:\s*(\d+)/.exec(this.text())

			if(t&&a) root.ramUsage = Math.round( a[1]/t[1] * 100)
		}
		
	}

	FileView{
		id: tempView
		path: "/sys/class/thermal/thermal_zone0/temp"

		onLoaded: root.temp = Math.round(parseInt(this.text()) / 1000)
	}

	FileView{
		id: uptimeView
		path: "/proc/uptime"

		onLoaded: {
			const s = parseFloat(this.text().split(/\s+/)[0])
			root.uptimeHour = Math.floor(s/3600) % 24
			root.uptimeMinute = Math.floor(s/60) % 60
		}
	}



	Timer{
		interval: 8000
		running:true
		repeat:true
		onTriggered:{
			cpuView.reload()
			ramView.reload()
			uptimeView.reload()
		}
	}

	Timer{
		interval: 4000
		running:true
		repeat:true
		onTriggered:{
			tempView.reload()
		}
	}
}	

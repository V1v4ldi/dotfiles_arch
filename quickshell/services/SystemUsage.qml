pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import qs.services

Singleton{
	id:systemService

	property int ramUsage: 0
	property int cpuUsage: 0
	property int diskUsage: 0
	property int temp: 0
	property int uptimeHour: 0
	property int uptimeMinute: 0
	property string whoami: ""

	Battery{id:battService}
	
	property real batt: battService.battPercentage
	property int isCharging: battService.battStatus
	property real battTTF: battService.timeToFull
	property real battTTE: battService.timeToEmpty 

	Process{
		id:systemProcs
		command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone0/temp;
		free -m | awk 'NR==2 {print $2}';
		free -m | awk 'NR==2 {print $3}'; 
		top -bn2 | grep 'Cpu(s)' | tail -1 | awk '{print 100 - $8}';
		df -h / | awk 'NR==2 {print $5}' | sed 's/%//';
		uptime -p | sed -e 's/up //; s/hours//; s/minutes//; s/,//' | awk {'print $1'};
		uptime -p | sed -e 's/up //; s/hours//; s/minutes//; s/,//' | awk {'print $2'};
		whoami;"]

		stdout: StdioCollector{
			onStreamFinished:{
				let data = text.trim().split(/\n/)

				if (data.length >= 6) {
					systemService.temp = parseInt(data[0]) / 1000
					systemService.ramUsage = Math.round(parseInt(data[2]) / parseInt(data[1]) * 100)
					systemService.cpuUsage = parseFloat(data[3])
					systemService.diskUsage = parseInt(data[4])
					systemService.uptimeHour = parseInt(data[5])
					systemService.uptimeMinute = parseInt(data[6])
					systemService.whoami = data[7]
				}
			}
			
		}
		
	}
	
	Timer {
			interval: 3500
			running: true
			repeat: true
			onTriggered: {
				systemProcs.running = true
			}
		}
}	

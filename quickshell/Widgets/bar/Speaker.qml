import QtQuick 
import QtQuick.Layouts
import Quickshell
import qs.Core
import qs.services as Service
	
Row {
	id:speakerWid
	spacing: 4

	Text {
		id:speakerText
		anchors.verticalCenter: parent.verticalCenter

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize
		color: Colors.on_background
		text: {
			(Service.Audio?.muted ?? false) ? Icons.mute :
			(Service.Audio?.volume * 100 ?? 0) <= 25 ? Icons.volumeLow :
			(Service.Audio?.volume * 100 ?? 0) <= 50 ? Icons.volumeMed : Icons.volumeHigh
		}
	}
		
	Text {
		id:speakerValText
		visible: !Service.Audio.muted
		anchors.verticalCenter: parent.verticalCenter

		leftPadding:3
		text: Math.round(Service.Audio.volume * 100) + "%"
		font.family: FontAndSizeRule.fontFamily	
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background
	}
}

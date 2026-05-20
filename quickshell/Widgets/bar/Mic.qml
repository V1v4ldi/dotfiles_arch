import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services as Service
import qs.Core

Row{
	id:micWid
	spacing: 4

	Text{
		id:micText
		anchors.verticalCenter: parent.verticalCenter

		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.iconSize
		color: Colors.on_background
		text: Service.Audio.micMuted ? Icons.micMute : Icons.mic
	}
			
	Text {
		id:micValText
		visible: !Service.Audio.micMuted
		anchors.verticalCenter: parent.verticalCenter

		leftPadding:3
		text: Math.round(Service.Audio.micVolume * 100) + "%"
		font.family: FontAndSizeRule.fontFamily
		font.pixelSize: FontAndSizeRule.fontSize
		color: Colors.on_background
	}
}

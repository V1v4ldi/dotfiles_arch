import Quickshell
import QtQuick
import QtQuick.Layouts
import "./components/" as Comp
import quickshell

Item {
	id: root
	visible: opened

	property bool opened: false
	property int controlCenterWidth: Quickshell.screens[0].width / 5

	onOpenedChanged: {
		if (opened){
			visible = true
			ccRoot.x = Quickshell.screens[0].width
			scrim.opacity = 0
			openAnim.restart()
		} else{
			closeAnim.restart()
		}
	}

	function close() {
		opened = false
	}

	Rectangle{
		id: scrim
		anchors.fill: parent
		opacity: 0
		enabled: opacity > 0.01
		Behavior on opacity { NumberAnimation { duration: 280; easing.type: Easing.OutCubic } }
		
		MouseArea {
            anchors.fill: parent
            enabled: parent.enabled
            onClicked: root.close()
        }
	}

	Rectangle{
		id: ccRoot
		width: controlCenterWidth
		height: parent.height
		x: Quickshell.screens[0].width

		layer.enabled:true

		color: Colors.background

		FocusScope{
			anchors.fill: parent

			Flickable{
				id: flickable
				contentHeight: ccColumn.height + 30
				boundsBehavior: Flickable.StopAtBounds
				clip: true

				anchors.fill: parent
				
				ColumnLayout{
					id:ccColumn
					spacing: 18
					anchors{
						left: parent.left
						right: parent.right
						rightMargin: 30
						leftMargin:30
					}
						
					Comp.SystemUsage{
						id: systemUsage
						Layout.topMargin: 30
						bgColor: Qt.alpha(Colors.on_primary, 0.4)
					}

					Rectangle{
						id: connContainer
						
						color: Qt.alpha(Colors.on_primary, 0.4)
						
						Layout.fillWidth: true
						height: connColumn.height + 10
						Layout.alignment: Qt.AlignHCenter

						ColumnLayout{
							id:connColumn
							spacing: 18
							width:parent.width

							Comp.Bluetooth{
								id: bt
								Layout.topMargin:10
								Layout.fillWidth: true
								Layout.leftMargin: 5
								Layout.rightMargin: 5
							}

							Comp.Network{
								id:wf
								Layout.fillWidth: true
								Layout.leftMargin: 5
								Layout.rightMargin: 5
							}
						}

					}
				
					MetricPillWid{
						mode: "side"
						implicitWidth: parent.width
						implicitHeight: 60
						bgColor: Qt.alpha(Colors.on_primary, 0.4)
						separators:[30,70]
						gapSize: 10
						separatorColor: Colors.background
						limit: 150
						sliderVal:Math.round(Audio.volume * 100)
						moved: function(val){
								if(Audio.defaultSink){
										Audio.setVolume(val / 100)
									}
								}
						iconStart: Math.round(Audio.volume * 100) + " %"
						iconEnd: (Audio?.muted ?? false) ? Icons.mute :
								 ((Audio?.volume * 100 ?? 0) <= 25) ? Icons.volumeLow :
								 ((Audio?.volume * 100 ?? 0) <= 50) ? Icons.volumeMed : Icons.volumeHigh
					}
					MetricPillWid{
						mode: "side"
						implicitWidth: parent.width
						implicitHeight: 60
						bgColor: Qt.alpha(Colors.on_primary, 0.4)
						separators:[30,70]
						gapSize: 10
						separatorColor: Colors.background
						limit: 100
					}
					MetricPillWid{
						mode: "side"
						implicitWidth: parent.width
						implicitHeight: 60
						bgColor: Qt.alpha(Colors.on_primary, 0.4)
						separators:[30,70]
						gapSize: 10
						separatorColor: Colors.background
						limit: 100
					}
				}
			}
		}
	}

	//Animation
	ParallelAnimation{
		id:openAnim
		NumberAnimation{
			target: scrim; property: "opacity"
			to:0.085; duration: 280; easing.type: Easing.InCubic
		}
		NumberAnimation{
			target: ccRoot; property: "x"
			from: Quickshell.screens[0].width; to: Quickshell.screens[0].width - controlCenterWidth; duration: 280; easing.type: Easing.InCubic
			
		}
	}

	ParallelAnimation{
		id:closeAnim
		NumberAnimation{
			target: scrim; property: "opacity"
			to:0; duration: 280; easing.type: Easing.InCubic
		}
		NumberAnimation{
			target: ccRoot; property: "x"
			from: Quickshell.screens[0].width - controlCenterWidth; to: Quickshell.screens[0].width; duration: 280; easing.type: Easing.InCubic
		}
	}

	Timer{
		id: closeTimer
		interval: 600
		running:!root.opened
		onTriggered: {
			if(root.parent){
				root.parent.active = false
			}
		}
	}

	Shortcut{
		sequences: ["Escape"]
		enabled: root.opened
		onActivated: {
			root.opened = false
		}
	}
}

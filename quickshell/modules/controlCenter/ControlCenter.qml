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

					Rectangle{
						id: audioContainer
						height: audioVolume.height + audioSource.height + audioSlider.height
						color: Colors.background

						anchors{
							left: parent.left
							right: parent.right
							rightMargin: 5 * FontAndSizeRule.scaleFactor
							leftMargin: 5 * FontAndSizeRule.scaleFactor
						}
						
						Text{
							id:audioVolume
							anchors{
								top: parent.top
							}
							font.family: FontAndSizeRule.fontFamily
							font.pixelSize: FontAndSizeRule.fontSize * 1.5
							color: Colors.on_primary_container
							text: "Speaker Volume"
						}

						Text{
							id:audioSource
							anchors{
								top: audioVolume.bottom
								topMargin: 3 * FontAndSizeRule.scaleFactor
							}
							font.family: FontAndSizeRule.fontFamily
							font.pixelSize: FontAndSizeRule.fontSize * 1.1
							color: Qt.alpha(Colors.on_primary_container, 0.8)
							text: Audio.speakerName
						}
				
						SliderWid{
							anchors{
								top: audioSource.bottom
								topMargin: 3 * FontAndSizeRule.scaleFactor
							}
							id: audioSlider
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
					}

					Rectangle{
						id: micContainer	
						height: micVolume.height + micSource.height + micSlider.height
						color: Colors.background	

						anchors{
							left: parent.left
							right: parent.right
							rightMargin: 5 * FontAndSizeRule.scaleFactor
							leftMargin: 5 * FontAndSizeRule.scaleFactor
						}
						
						Text{
							id:micVolume
							anchors{
								top: parent.top
							}
							font.family: FontAndSizeRule.fontFamily
							font.pixelSize: FontAndSizeRule.fontSize * 1.5
							color: Colors.on_primary_container
							text: "Mic Volume"
						}

						Text{
							id:micSource
							anchors{
								top: micVolume.bottom
								topMargin: 3 * FontAndSizeRule.scaleFactor
							}
							font.family: FontAndSizeRule.fontFamily
							font.pixelSize: FontAndSizeRule.fontSize * 1.1
							color: Qt.alpha(Colors.on_primary_container, 0.8)
							text: Audio.micName
						}
					
					
						SliderWid{
							id:micSlider
							anchors{
								top: micSource.bottom
								topMargin: 3 * FontAndSizeRule.scaleFactor
							}
							implicitWidth: parent.width
							implicitHeight: 60
							bgColor: Qt.alpha(Colors.on_primary, 0.4)
							separators:[30,70]
							gapSize: 10
							separatorColor: Colors.background
							limit: 100
							sliderVal:Math.round(Audio.micVolume * 100)
							moved: function(val){
									if(Audio.defaultSource){
											Audio.setSourceVolume(val / 100)
										}
									}
							iconStart: Math.round(Audio.micVolume * 100) + " %"
							iconEnd: (Audio?.micMuted ?? false) ? Icons.micMute : Icons.mic
						}
					}
				
					Rectangle{
						id: brightnessContainer	
						height: brightnessText.height + brightnessSlider.height
						color: Colors.background	

						anchors{
							left: parent.left
							right: parent.right
							rightMargin: 5 * FontAndSizeRule.scaleFactor
							leftMargin: 5 * FontAndSizeRule.scaleFactor
						}
						
						Text{
							id: brightnessText

							anchors{
								top: parent.top
							}

							font.family: FontAndSizeRule.fontFamily
							font.pixelSize: FontAndSizeRule.fontSize * 1.5
							color: Colors.on_primary_container
							text: "Brightness"
						}

						SliderWid{
							id: brightnessSlider

							anchors{
								top: brightnessText.bottom
								topMargin: 3 * FontAndSizeRule.scaleFactor
							}

							implicitWidth: parent.width
							implicitHeight: 60
							bgColor: Qt.alpha(Colors.on_primary, 0.4)
							separators:[25,75]
							gapSize: 10
							separatorColor: Colors.background
							limit: 100
							sliderVal: Brightness.current_brightness_perc
							moved: function(val){
								Brightness.setBrightness(val)
							}
							iconStart: Brightness.current_brightness_perc + " %"
							iconEnd: (Brightness.current_brightness_perc < 25) ? Icons.brightLow :
									  (Brightness.current_brightness_perc < 75) ? Icons.brightMed : Icons.brightHigh
						}
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

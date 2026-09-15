import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.modules.controlCenter.components
import qs.Core

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
			focus: root.opened

			Flickable{
				id: flickable
				contentHeight: ccColumn.height + 30
				boundsBehavior: Flickable.StopAtBounds
				clip: true

				anchors.fill: parent
				
				ColumnLayout{
					id:ccColumn
					spacing: 18
					width: parent.width
						
					SystemUsage{
						id: systemUsage
						Layout.fillWidth: true
						Layout.alignment: Qt.AlignHCenter
						Layout.topMargin: 20
						Layout.leftMargin: 30
						Layout.rightMargin: 30
					}

					Rectangle{
						id: connContainer
						
						color: Qt.alpha(Colors.on_primary, 0.4)
						
						Layout.fillWidth: true
						height: connColumn.height + 10
						Layout.alignment: Qt.AlignHCenter
						Layout.leftMargin: 30
						Layout.rightMargin: 30

						ColumnLayout{
							id:connColumn
							spacing: 18
							width:parent.width

							Bluetooth{
								id: bt
								Layout.topMargin:10
								Layout.fillWidth: true
								Layout.leftMargin: 5
								Layout.rightMargin: 5
							}

							Network{
								id:wf
								Layout.fillWidth: true
								Layout.leftMargin: 5
								Layout.rightMargin: 5
							}
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
}

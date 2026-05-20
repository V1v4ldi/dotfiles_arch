import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Core
import qs.modules.settings.components

Item {
	id: root
	focus:true
	visible: opened

	property bool opened: false

	onOpenedChanged: {
		if(opened) {
			visible = true
			settings.y = -settings.height
			openAnim.start()
		} else {
			closeAnim.start()
		}
	}

	function close() {
		opened = false
	}


	Rectangle{
		id: settings 
		layer.enabled: true

		implicitWidth: 700
		implicitHeight: 550
		radius: 16
		opacity: 0.85
		border.color: Colors.outline
		y: -height
		x: (Quickshell.screens[0].width / 2) - (settings.implicitWidth / 2)
		color: Colors.background
		
		Close{
			id: close
			
			anchors{ 
				top:parent.top
				right: parent.right
				left: parent.left
			}
		}

		RowLayout{
			anchors.top: close.bottom
			anchors.left: parent.left
			anchors.right: parent.right
			anchors.bottom: parent.bottom
			spacing: 0

			Title{
				id:title
				Layout.fillHeight: true
				Layout.preferredWidth: parent.width / 4
				color: "transparent"
			}
				
			Rectangle{
				id:content
				Layout.fillHeight: true
				Layout.fillWidth: true
				color: "transparent"
				bottomRightRadius: 16
			}

		}
	}
	//Animation
	ParallelAnimation{
		id:openAnim
		
		NumberAnimation{
			target: settings; property: "y"
			from: -settings.height; to: (Quickshell.screens[0].height / 2) - (settings.height / 2); duration: 280; easing.type: Easing.InCubic
		}
	}

	ParallelAnimation{
		id:closeAnim
		
		NumberAnimation{
			target: settings; property: "y"
			from: (Quickshell.screens[0].height / 2) - (settings.height / 2); to: Quickshell.screens[0].height; duration: 280; easing.type: Easing.InCubic
		}
	}
}
/*
 *

 *  Rectangle{
					id:settingsTitle
					anchors.fill: parent
					radius: 12
					border.color:"white"
					border.width: 1
					ColumnLayout{
						anchors.fill: parent
						spacing: 8
						Rectangle{
							Layout.fillWidth: true
							height: 18
							color: "transparent"
								
							Text{
								anchors.centerIn: parent
								font.family: FontAndSizeRule.fontFamily
								font.pixelSize: FontAndSizeRule.fontSize
								color: "white"

								text: "Wifi"
							}


						}
					}

				}
 *	visible: true
	color:"transparent"

	anchor.window: barRoot
	anchor.rect.x: (barRoot.screen.width / 2) - (width / 2)
	anchor.rect.y: (barRoot.screen.height / 2) - (height / 2)

    onVisibleChanged: {
        if (!visible) closed()
	}

	Rectangle {
		anchors.fill: parent
        radius: 12
		color: "#1a1a1a"

		Rectangle{
			id: closeBtn
			radius: 10
			color: closeBtnArea.containsMouse ? "#ff5555" : "transparent"
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.topMargin: 8
			anchors.rightMargin: 8

			Text{
				anchors.centerIn: parent
				text: "x"
				color: "white"
				font.pixelSize: 18
			}

			MouseArea {
                id: closeBtnArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: settingsPopup.visible = false
            }
		}

		Rectangle{
			id:settingsTitle
			anchors.left: parent.left
			anchors.top: closeBtn.bottom
			anchors.topMargin: 8
			implicitWidth: parent.width / 4
			implicitHeight: parent.height - y

			Rectangle{
				id:titleContent
				anchors.centerIn: parent
				implicitWidth: parent.width
				implicitHeight: parent.height
				color: "white"

				Column{
					id:contentColumn
					anchors.centerIn: parent
					spacing: 10
					property real maxWidth: Math.max(r1.contentWidth, r2.contentWidth, r3.contentWidth, r4.contentWidth)
					
					Rectangle{
						id: wifiBtn
						anchors.horizontalCenter: parent.horizontalCenter
						implicitWidth:parent.maxWidth + 20
						implicitHeight: 25
						Text{
							id: r1
							text: "Wifi"
							font.pixelSize: 18
							color: "red"
							anchors.horizontalCenter: parent.horizontalCenter
						}
						MouseArea {
						    id: wifiBtnArea
							anchors.fill: parent
							hoverEnabled: true
							cursorShape: Qt.PointingHandCursor
							onClicked: {
								settingsLoader.active = false
								settingsLoader.source = "./components/Wifi.qml"
								settingsLoader.active = true
							}
						}

					}
					
					Rectangle{
						id:btBtn
						anchors.horizontalCenter: parent.horizontalCenter
						implicitWidth:parent.maxWidth + 20
						implicitHeight: 25

						Text{
							id: r2
							text: "Bluetooth"
							font.pixelSize: 18
							color: "red"
							anchors.horizontalCenter: parent.horizontalCenter
						}
						MouseArea {
						    id: btBtnArea
							anchors.fill: parent
							hoverEnabled: true
							cursorShape: Qt.PointingHandCursor
							onClicked: {
								settingsLoader.active = false
								settingsLoader.source = "./components/Bluetooth.qml"
								settingsLoader.active = true
							}
						}

					}
					
					Rectangle{
						id:themeBtn
						anchors.horizontalCenter: parent.horizontalCenter
						implicitWidth:parent.maxWidth + 20
						implicitHeight: 25

						Text{
							id:r3
							text: "Theme"
							font.pixelSize: 18
							color: "red"
							anchors.horizontalCenter: parent.horizontalCenter
						}
						MouseArea {
						    id: themeBtnArea
							anchors.fill: parent
							hoverEnabled: true
							cursorShape: Qt.PointingHandCursor
							onClicked: {
								settingsLoader.active = false
								settingsLoader.source = "./components/Theme.qml"
								settingsLoader.active = true
							}
						}
					}

					Rectangle{
						id:profileBtn
						anchors.horizontalCenter: parent.horizontalCenter
						implicitWidth:parent.maxWidth + 20
						implicitHeight: 25

						Text{
							id:r4
							text: "Profile"
							font.pixelSize: 18
							color: "red"
							anchors.horizontalCenter: parent.horizontalCenter
						}
						MouseArea {
						    id: profileBtnArea
							anchors.fill: parent
							hoverEnabled: true
							cursorShape: Qt.PointingHandCursor
							onClicked: {
								settingsLoader.active = false
								settingsLoader.source = "./components/Profile.qml"
								settingsLoader.active = true
							}
						}

					}
				}
				
			}
		}

		Rectangle{
			id:settingsSect
			anchors.right: parent.right
			anchors.top: closeBtn.bottom
			anchors.left: settingsTitle.right
			anchors.topMargin: 8
			implicitWidth: ( parent.width * 0.75 )
			implicitHeight: parent.height - y

			Loader{
				id: settingsLoader
				active: true
				source: ""
				anchors.fill: parent
			}
		}

	}

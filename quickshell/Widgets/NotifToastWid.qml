import Quickshell
import quickshell
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: popupWindow

    color: "transparent"

    // Mengikuti ukuran otomatis dari konten di dalamnya
    implicitWidth: mainColumn.implicitWidth
    implicitHeight: mainColumn.implicitHeight

    ColumnLayout {
        id: mainColumn
        spacing: 12

        Repeater {
            model: Notification.popups

            delegate: Rectangle {
                id: card
                required property var modelData

                Layout.preferredWidth: 360
                Layout.preferredHeight: contentLayout.implicitHeight + 24
                
                // Styling visual
                color: "#1e1e2e"
                border.color: card.modelData.urgency === 2 ? "#f38ba8" : "#313244"
                border.width: 1
                radius: 12

                RowLayout {
                    id: contentLayout
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 12

                    // 1. App Icon / Image di sebelah kiri
                    Image {
                        Layout.preferredWidth: 40
                        Layout.preferredHeight: 40
                        Layout.alignment: Qt.AlignTop
                        source: card.modelData.image !== "" ? card.modelData.image : card.modelData.appIcon
                        fillMode: Image.PreserveAspectFit
                        visible: source !== ""
                    }

                    // 2. Area Teks Utama (Column)
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4

                        RowLayout {
                            Layout.fillWidth: true
                            
                            Text {
                                text: card.modelData.appName
                                color: "#cba6f7"
                                font.pixelSize: 11
                                font.bold: true
                                Layout.fillWidth: true
                            }

                            Text {
                                text: card.modelData.timeStr
                                color: "#6c7086"
                                font.pixelSize: 10
                            }
                        }

                        Text {
                            text: card.modelData.summary
                            color: "#cdd6f4"
                            font.pixelSize: 13
                            font.bold: true
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                        }

                        Text {
                            text: card.modelData.body
                            color: "#a6adc8"
                            font.pixelSize: 12
                            wrapMode: Text.Wrap
                            maximumLineCount: 3
                            elide: Text.ElideRight
                            Layout.fillWidth: true
                            visible: text !== ""
                        }

                        // 3. Action Buttons (Jika ada aksi pada notifikasi)
			RowLayout {
				Layout.fillWidth: true
				Layout.topMargin: 4
				spacing: 8
				visible: card.modelData && card.modelData.actions && card.modelData.actions.length > 0

				Repeater {
					model: card.modelData ? card.modelData.actions : []

					delegate: Rectangle {
						id: actionBtn
						required property var modelData

						Layout.fillWidth: true
						Layout.preferredHeight: 28
						color: "#313244"
						radius: 6

						Text {
							anchors.centerIn: parent
							text: actionBtn.modelData ? actionBtn.modelData.text : ""
							color: "#cdd6f4"
							font.pixelSize: 11
						}

						MouseArea {
							anchors.fill: parent
							cursorShape: Qt.PointingHandCursor
							onClicked: {
								// Null-check sebelum mengeksekusi invoke
								if (actionBtn.modelData && typeof actionBtn.modelData.invoke === "function") {
									actionBtn.modelData.invoke();
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

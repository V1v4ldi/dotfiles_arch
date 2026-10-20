import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import qs.services as Service
import quickshell

/* This Widget Can Be Used For Speaker And Mic */

Item{
	id: root

	property string mode: ""
	
	property string icon: ""
	property string text: ""
	property bool visibility: false
	property color bgColor: "transparent"

	property var separators: []
	property string separatorColor: ""
	property string iconStart: ""
	property string iconEnd: ""
	property int gapSize: 0
	property int limit: 0
	property var moved: ""
	property real sliderVal: 0

	implicitWidth: audioLoader.item ? audioLoader.item.implicitWidth * FontAndSizeRule.scaleFactor : 0
	implicitHeight: audioLoader.item ? audioLoader.item.implicitHeight * FontAndSizeRule.scaleFactor : 0

/* This is Top Bar Audio Component */
	Component{
		id: topBarComponent

		RowLayout{
			id:topBarRoot
			spacing: 4

			Text{
				id:audioIcon
				Layout.alignment: Qt.AlignVCenter
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.iconSize
				color: Colors.on_background

				text: root.icon
			}
					
			Text {
				id:audioText
				visible: root.visibility	
				leftPadding:3 * FontAndSizeRule.scaleFactor
				Layout.alignment: Qt.AlignVCenter
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.fontSize
				color: Colors.on_background
 
				text: root.text
			}

		}

		
	}

/* This is Side Panel Audio Component */
	Component{
		id: panelComponent
		
		Slider{
			id: slider

			anchors{
				rightMargin: 30 * FontAndSizeRule.scaleFactor
				leftMargin: 30 * FontAndSizeRule.scaleFactor
			}

			value: root.sliderVal
			from: 0
			to: root.limit
			implicitWidth: root.implicitWidth > 0 ? root.implicitWidth * FontAndSizeRule.scaleFactor : 0
			implicitHeight: root.implicitHeight > 0 ? root.implicitHeight * FontAndSizeRule.scaleFactor : 0

			background: ClippingRectangle{
				id: sliderBg

				x: slider.leftPadding
				y: slider.topPadding + slider.availableHeight / 2 - height / 2
				width: slider.availableWidth
				height: slider.availableHeight
				radius: 24
				clip: true
				color: root.bgColor

				Rectangle{
					id: progressFill

					width: slider.visualPosition * parent.width
					height: parent.height
					color: Colors.on_secondary
				}

				Repeater{
					model: root.separators

					Rectangle{
						required property var modelData

						x: (modelData / slider.to) * sliderBg.width - (root.gapSize / 2)
						y: 0
						width: root.gapSize
						height: parent.height
						color: root.separatorColor
					}
				}

				Rectangle{
					id: sliderProgress
					x:sliderHandler.x - sliderBg.x
					y:0
					width: 4 * FontAndSizeRule.scaleFactor
					height: slider.availableHeight
					color: Colors.secondary
					radius: 1.5
				}

				Text{
					id:iconLeft
					visible: root.iconStart != "" ?? false
					font.family: FontAndSizeRule.fontFamily
					font.pixelSize: FontAndSizeRule.fontSize
					color: Colors.secondary
					anchors.verticalCenter: parent.verticalCenter
					x:15 * FontAndSizeRule.scaleFactor
					text: root.iconStart

				}

				Text{
					id:iconRight
					visible: root.iconEnd != "" ?? false
					font.family: FontAndSizeRule.fontFamily
					font.pixelSize: FontAndSizeRule.iconSize
					color: Colors.secondary
					anchors{
						right: parent.right
						rightMargin: 15
						verticalCenter: parent.verticalCenter
					}
					text: root.iconEnd

				}

			}

			handle: ClippingRectangle{
				id: sliderHandler

				x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
				y: slider.topPadding + (slider.availableHeight - height) / 2
				implicitWidth: 3 * FontAndSizeRule.scaleFactor
				implicitHeight: slider.availableHeight
				radius: 1.5
				color: "transparent"
			}

			HoverHandler{
				cursorShape:Qt.PointingHandCursor
			}

			onMoved: {
				if(root.moved != ""){
					root.moved(slider.value)
				}
			}
		}
	}

	Loader{
		id: audioLoader
		sourceComponent: 
		root.mode === "compact" ? topBarComponent : 
		root.mode === "side" ? panelComponent : null
	}

}

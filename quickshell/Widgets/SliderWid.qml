import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import quickshell

/* This Widget Slider Widget */

Slider{
	id: root

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

	value: root.sliderVal
	from: 0
	to: root.limit
	implicitWidth: root.implicitWidth > 0 ? root.implicitWidth * FontAndSizeRule.scaleFactor : 0
	implicitHeight: root.implicitHeight > 0 ? root.implicitHeight * FontAndSizeRule.scaleFactor : 0

	background: ClippingRectangle{
		id: sliderBg

		x: root.leftPadding
		y: root.topPadding + root.availableHeight / 2 - height / 2
		width: root.availableWidth
		height: root.availableHeight
		radius: 24
		clip: true
		color: root.bgColor

		Rectangle{
			id: progressFill

			width: root.visualPosition * parent.width
			height: parent.height
			color: Colors.on_secondary
		}

		Repeater{
			model: root.separators

			Rectangle{
				required property var modelData

				x: (modelData / root.to) * sliderBg.width - (root.gapSize / 2)
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
			height: root.availableHeight
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

		x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
		y: root.topPadding + (root.availableHeight - height) / 2
		implicitWidth: 3 * FontAndSizeRule.scaleFactor
		implicitHeight: root.availableHeight
		radius: 1.5
		color: "transparent"
	}

	HoverHandler{
		cursorShape:Qt.PointingHandCursor
	}

	onMoved: {
		if(root.moved != ""){
			root.moved(root.value)
		}
	}
}

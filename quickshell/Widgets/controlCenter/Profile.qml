import QtQuick
import Quickshell
import Quickshell.Widgets

ClippingRectangle{
	id:root
	width: 128
	height: 128
	radius: width / 2

	color: "red"
	antialiasing: true
	clip:true

	Image{
		anchors.fill: parent
		source: "file:///home/ballack/Pictures/wallpapers/Kilua.png"

		fillMode: Image.PreserveAspectCrop
		smooth:true
		antialiasing: true

	}
}

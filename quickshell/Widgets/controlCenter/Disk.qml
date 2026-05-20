import qs.Core
import Quickshell
import QtQuick
import QtQuick.Shapes
import qs.services as Service

Rectangle{
	id: root

	width: FontAndSizeRule.sysUsageBorderSize
	height: FontAndSizeRule.sysUsageBorderSize
	radius: 8

	color: "transparent"

	Row{
		id:diskRow
		anchors.centerIn: parent

		Column{
			id:diskColumn
			anchors.verticalCenter: parent.verticalCenter

			Rectangle{
				id: shapeContainer
				width: FontAndSizeRule.sysUsageCircularSize
				height: FontAndSizeRule.sysUsageCircularSize
				color: "transparent"

				Shape{
					anchors.fill: parent
					layer.enabled: true
					layer.samples: 4

					ShapePath {
						strokeColor: "#2a4d27"
						strokeWidth: 4
						fillColor: "transparent"
        
						PathAngleArc {
							centerX: shapeContainer.width / 2; centerY: shapeContainer.height / 2
							radiusX: (shapeContainer.width / 2) - 10; radiusY: (shapeContainer.height / 2) - 10
							startAngle: -90
							sweepAngle: 360
						}
					}

					ShapePath{
						strokeColor: "#3bc431"
						strokeWidth: 4
						fillColor: "transparent"

						PathAngleArc{
							centerX: shapeContainer.width / 2; centerY: shapeContainer.height / 2
							radiusX: (shapeContainer.width / 2) - 10; radiusY: (shapeContainer.height / 2) - 10
							startAngle: -90
							sweepAngle: Service.SystemUsage.diskUsage * 3.6
						}
					}

					Text{
						id: diskIcon

						anchors.centerIn:parent
						font.family: FontAndSizeRule.fontFamily
						font.pixelSize: FontAndSizeRule.iconSysSize
						color: "#3bc431"

						text: Icons.diskIcon
					}
				}
			}
			Text{
				anchors.horizontalCenter: parent.horizontalCenter
				font.family: FontAndSizeRule.fontFamily
				font.pixelSize: FontAndSizeRule.sysUsageBorderSize / 10 + 2
				color: "#e0e0e0"
			
				text: "Disk: " + Service.SystemUsage.diskUsage + "%"
			}	
		}
		

		
	}
}

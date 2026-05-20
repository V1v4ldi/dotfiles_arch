import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import qs.modules.bar.components
import qs.Core

Item {
		id:barRoot

		implicitHeight: 28
		anchors.left: parent.left
		anchors.right: parent.right
		focus:true

	Item{
		id:barContent
		anchors.fill: parent
		
		Rectangle{
			id:containerLeft
			anchors.left: parent.left
			width: layoutLeft.implicitWidth
			height: parent.height
			radius:10
			color: Colors.surface_container_lowest
			anchors.leftMargin: 8

			
			RowLayout{
				id:layoutLeft
				anchors.verticalCenter: parent.verticalCenter

				AppLauncher{
					Layout.leftMargin: 16
				}

				Separator{
					type:"dot-line"
					Layout.leftMargin: 10
					Layout.rightMargin: 10
				}

				Workspaces{
					height: containerLeft.height
				}
			}
		}
			
		Rectangle{
			id: containerMid
			anchors.centerIn: parent
			width: layoutMid.implicitWidth
			height: parent.height
			radius: 10	
			color: Colors.surface_container_lowest

			RowLayout{
				id: layoutMid
				anchors.verticalCenter: parent.verticalCenter

					
				Separator{
					type:"dot-line"
					Layout.leftMargin: 10
					Layout.rightMargin: 10
				}					

				Clock{}				
			}
		}

		Rectangle{
			id: containerRight
			anchors.right: parent.right
			height: parent.height
			width: layoutRight.width + 40
			radius: 10
			color: Colors.surface_container_lowest
			anchors.rightMargin: 8

			Row{
				id:layoutRight
				spacing: 18

				anchors{
					verticalCenter: parent.verticalCenter
					right: parent.right

					rightMargin: 16
				}				

				Settings{
					id: settings
				}

				Separator{
					type:"dot-line"
				}
				
				Audio{
					id: audio
				}

				Battery{
					id: batt
				}

				Temp{
					id: temp
				}

				Separator{
					type:"dot-line"
				}

				ControlCenter{
					id: cc
				}
			}
		}
	}
}

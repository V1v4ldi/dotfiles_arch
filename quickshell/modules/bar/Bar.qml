import Quickshell
import Quickshell.Wayland
import QtQuick
import Quickshell.Hyprland
import QtQuick.Layouts
import quickshell
import "./components/" as Comp

Item {
	id:root
	property string primary: Colors.background

	implicitHeight: 28
	anchors{
		left: parent.left
		right: parent.right
		top: parent.top
		topMargin: 6 * FontAndSizeRule.scaleFactor 
	}
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
			color: root.primary
			anchors.leftMargin: 8

			
			RowLayout{
				id:layoutLeft
				anchors.verticalCenter: parent.verticalCenter

				Comp.AppLauncher{
					Layout.leftMargin: 16
				}

				Comp.Separator{
					type:"dot-line"
					Layout.leftMargin: 10
					Layout.rightMargin: 10
				}

				Comp.Workspaces{
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
			color: root.primary

			RowLayout{
				id: layoutMid
				anchors.verticalCenter: parent.verticalCenter

					
				Comp.Separator{
					type:"dot-line"
					Layout.leftMargin: 10
					Layout.rightMargin: 10
				}					

				Comp.Clock{}				
			}
		}

		Rectangle{
			id: containerRight
			anchors.right: parent.right
			height: parent.height
			width: layoutRight.width + 40
			radius: 10
			color: root.primary
			anchors.rightMargin: 8

			Row{
				id:layoutRight
				spacing: 18

				anchors{
					verticalCenter: parent.verticalCenter
					right: parent.right

					rightMargin: 16
				}				

				Comp.Settings{
					id: settings
				}

				Comp.Separator{
					type:"dot-line"
				}
				
				Comp.Audio{
					id: audio
				}

				Comp.Battery{
					id: batt
				}

				Comp.Temp{
					id: temp
				}

				Comp.Separator{
					type:"dot-line"
				}

				Comp.ControlCenter{
					id: cc
				}
			}
		}
	}
}

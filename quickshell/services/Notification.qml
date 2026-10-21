pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications as QsNotif
import QtQuick
import quickshell

Singleton {
	id: root
	property var data: []
	property var popups: data.filter(n => n && n.popup && !n.tracked)
	property var history: data

	QsNotif.NotificationServer {
		id: server

		keepOnReload: false
		actionsSupported: true
		bodyHyperlinksSupported: true
		bodyImagesSupported: true
		bodyMarkupSupported: true
		imageSupported: true


		onNotification: nObj => {
			if (!nObj) return;

			let item = notifComp.createObject(root, {
				popup: true,
				notification: nObj,
				shown: false
			});

			root.data = [...root.data, item];
		}

		function removeById(id) {
			root.data = root.data.filter(n => n && n.notification && n.notification.id !== id);
		}
	}

	component Notif: QtObject {
		id: notif

		property bool popup: true
		property bool tracked: false
		property bool shown: false

		readonly property date time: new Date()
		readonly property string timeStr: {
			const diff = new Date() - time.getTime()
			const m = Math.floor(diff / 60000)
			const h = Math.floor(m / 60)

			if (h < 1 && m < 1) 
				return "Now";
			if (h < 1) 
				return `${m}m`
			return `${h}h`
		}

		required property QsNotif.Notification notification
		property string summary: ""
		property string body: "" 
		property string appIcon: ""
		property string appName: ""
		property string image: ""
		property int urgency: 0
		property list<QsNotif.NotificationAction> actions: []

		onNotificationChanged: {
			if (!notification) return;
			summary = notification.summary;
			body = notification.body;
			appIcon = notification.appIcon;
			appName = notification.appName;
			image = notification.image;
			urgency = notification.urgency;
			actions = notification.actions;
		}

		readonly property Timer timer: Timer {
			running: notif.popup
			interval: (notif.notification && notif.notification.expireTimeout > 0) 
                      ? notif.notification.expireTimeout 
                      : 5000
			onTriggered: {
				if (true)
					notif.popup = false;
			}
		}

		readonly property Connections conn: Connections {
			target: notif.notification ? notif.notification.Retainable : null

			function onDropped(): void {
				root.data = root.data.filter(n => n !== notif);
			}

			function onAboutToDestroy(): void {
				notif.destroy();
			}
		}

		readonly property Connections conn2: Connections{
			target: notif.notification ? notif.notification : null

			function onClosed(reason) {
				root.data = root.data.filter(n => n !== notif);
			}
		}

	}

	Component {
        id: notifComp
        Notif {}
    }
}

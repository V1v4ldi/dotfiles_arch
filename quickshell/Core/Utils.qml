// This is where all helper functions located

pragma Singleton
import QtQuick
import Quickshell

QtObject{

	//Getting root of the project directory
	readonly property string rootPath: {
		var url = Qt.resolvedUrl("..").toString()
		return url.replace("file://", "").replace(/\$/, "")
	}

	readonly property string configPath: rootPath + "/Config"

	function path(relativePath){
		return rootPath + relativePath
	}
}


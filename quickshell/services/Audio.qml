pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import qs.services as Services

Singleton{
	PwObjectTracker {
        objects: [
            Pipewire.defaultAudioSource,
            Pipewire.defaultAudioSink,
            Pipewire.nodes,
            Pipewire.links
        ]
    }

	property var sinks: Pipewire.nodes.values.filter(node => node.isSink && !node.isStream && node.audio)
	property PwNode defaultSink: Pipewire.defaultAudioSink

	property var sources: Pipewire.nodes.values.filter(node => !node.isSink && !node.isStream && node.audio)
	property PwNode defaultSource: Pipewire.defaultAudioSource

	property bool muted: defaultSink?.audio?.muted ?? false
	property bool micMuted: defaultSource?.audio?.muted ?? false
	
	property real volume: Math.min(1.5, defaultSink?.audio?.volume ?? 0)
	property real micVolume: Math.min(1.5, defaultSource?.audio?.volume ?? 0)

	Connections {
        id: speakerConn
        target: defaultSink && defaultSink.audio ? defaultSink.audio : null

        function onVolumeChanged() {
			let vol = defaultSink.audio.volume;
		}

        function onMutedChanged() {
			let muted = defaultSink.audio.muted;
        }
    }

	Connections {
        id: micConn
        target: defaultSource && defaultSource.audio ? defaultSource.audio : null

        function onVolumeChanged() {
			let vol = defaultSource.audio.volume;
		}

        function onMutedChanged() {
            let muted = defaultSource.audio.muted;
        }
    }

    function setVolume(to: real): void {
        if (defaultSink?.ready && defaultSink?.audio) {
            defaultSink.audio.muted = false;
            let val = Math.max(0, Math.min(1.5, to));
            defaultSink.audio.volume = val
            //Services.Osd.show("volume", val * 100)
        }
    }

    function setSourceVolume(to: real): void {
        if (defaultSource?.ready && defaultSource?.audio) {
            defaultSource.audio.muted = false;
            let val = Math.max(0, Math.min(1.5, to));
            defaultSource.audio.volume = val
        }
	}

	function volumeInc(audio): void {
		if (audio == "Source") {
			if(defaultSource?.ready && defaultSource?.audio) {
				defaultSource.audio.muted = false;
				defaultSource.audio.volume = Math.min(1.5, defaultSource.audio.volume + 0.05)
			}
		}

		else if (audio == "Sink") {
			if (defaultSink?.ready && defaultSink?.audio) {
				defaultSink.audio.muted = false;
				defaultSink.audio.volume = Math.min(1.5, defaultSink.audio.volume + 0.05)
			}
		}

	}

	function volumeDec(audio): void {
		if (audio == "Source") {
			if(defaultSource?.ready && defaultSource?.audio) {
				defaultSource.audio.muted = false;
				defaultSource.audio.volume = Math.max(0, defaultSource.audio.volume - 0.05)
			}
		}

		else if (audio == "Sink") {
			if (defaultSink?.ready && defaultSink?.audio) {
				defaultSink.audio.muted = false;
				defaultSink.audio.volume = Math.max(0, defaultSink.audio.volume - 0.05)
			}
		}

	}

	function toggleMute(audio): void {
		if (audio == "Source") {
			if(defaultSource?.ready && defaultSource?.audio) {
				defaultSource.audio.muted = !defaultSource.audio.muted;
			}
		}

		else if (audio == "Sink") {
			if (defaultSink?.ready && defaultSink?.audio) {
				defaultSink.audio.muted = !defaultSink.audio.muted;
			}
		}

	}

    function setDefaultSink(sink: PwNode): void {
        Pipewire.preferredDefaultAudioSink = sink;
    }

    function setDefaultSource(source: PwNode): void {
        Pipewire.preferredDefaultAudioSource = source;
    }

    function init() {
    }
}

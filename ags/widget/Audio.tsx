import { GObject } from "astal";
import { astalify, ConstructProps, App, Astal, Gdk, Gtk, GLib } from "astal/gtk3";

class AudioBar extends astalify(Gtk.Scale) {
    static {
        GObject.registerClass(this);
    }

    constructor(
        props: ConstructProps<Gtk.Scale, Gtk.Scale.ConstructorProps>
    ) {
        super({
            ...props,
            orientation: Gtk.Orientation.HORIZONTAL,
            adjustment: new Gtk.Adjustment({
                lower: 0,
                upper: 100,
                step_increment: 1,
                value: AudioBar.getVolume(),
            }),
        });

        this.connect("value-changed", () => {
            const value = this.get_value();
            AudioBar.setVolume(value);
        });
    }

    static getVolume(): number {
        try {
            const [success, stdout] = GLib.spawn_command_line_sync("pamixer --get-volume");
            if (success && stdout) {
                return parseInt(stdout.toString().trim(), 10) || 0;
            }
        } catch {
            // Handle errors gracefully
        }
        return 0; // Default to 0 if the command fails
    }

    static setVolume(value: number): void {
        try {
            GLib.spawn_command_line_sync(`pamixer --set-volume ${value}`);
        } catch {
            // Handle errors gracefully
        }
    }
}

export default function AudioWidget() {
    const anchor = Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT;

    const isMuted = (): boolean => {
        try {
            const [success, stdout] = GLib.spawn_command_line_sync("pamixer --get-mute");
            if (success && stdout) {
                return stdout.toString().trim() === "true";
            }
        } catch {
            // Handle errors gracefully
        }
        return false; // Default to unmuted if the command fails
    };

    const volumeLabel = new Gtk.Label({
        label: isMuted() ? "Muted" : `${AudioBar.getVolume()}%`,
        valign: Gtk.Align.CENTER,
    });

    const updateLabel = () => {
        volumeLabel.set_label(isMuted() ? "Muted" : `${AudioBar.getVolume()}%`);
    };

    return (
        <window
            name="audio_widget"
            visible={true}
            application={App}
            anchor={anchor}
            keymode={Astal.Keymode.ON_DEMAND}
            onKeyPressEvent={(self, event: Gdk.Event) => {
                if (event.get_keyval()[1] === Gdk.KEY_Escape) {
                    self.hide();
                }
            }}
        >
            <box className="audio-widget" orientation={Gtk.Orientation.VERTICAL}>
                {volumeLabel}
                {new AudioBar({
                    hexpand: true,
                    vexpand: false,
                })}
            </box>
        </window>
    );
}



import { App, Widget } from "astal/gtk3";
import style from "./style.scss";
import Calendar from "./widget/Calendar";
import AudioWidget from "./widget/Audio";
import NotificationPopups from "./widget/NotificationPopups";
import OSD from "./widget/OSD";

App.start({
    css: style,
    main() {
        Calendar();
        App.get_monitors().map(NotificationPopups);
        App.get_monitors().map(OSD);
    },
});

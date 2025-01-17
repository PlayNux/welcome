/*
 * SPDX-License-Identifier: GPL-3.0-or-later
 * SPDX-FileCopyrightText: 2022 playnux, Inc. (https://playnux.io)
 */

public class welcome.UpdatesView : AbstractwelcomeView {
    public UpdatesView () {
        Object (
            view_name: "updates",
            description: _("Updates can be automatically installed when your device is connected to the Internet."),
            icon_name: "system-software-update",
            title: _("Automatic Updates")
        );
    }

    construct {
        var switch_label = new Gtk.Label (_("Free & Paid Apps:")) {
            halign = Gtk.Align.END
        };

        var switch = new Gtk.Switch () {
            halign = Gtk.Align.START
        };

        var settings = new GLib.Settings ("io.playnux.appcenter.settings");
        settings.bind ("automatic-updates", switch, "active", GLib.SettingsBindFlags.DEFAULT);

        custom_bin.attach (switch_label, 0, 0);
        custom_bin.attach (switch, 1, 0);
    }
}

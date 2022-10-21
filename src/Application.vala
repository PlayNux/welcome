// -*- Mode: vala; indent-tabs-mode: nil; tab-width: 4 -*-
/*-
 * Copyright (c) 2016 playnux LLC. (https://playnux.io)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Corentin Noël <corentin@playnux.io>
 */

public class welcome.App : Gtk.Application {
    construct {
        application_id = "io.playnux.installer";
        flags = ApplicationFlags.FLAGS_NONE;
        Intl.setlocale (LocaleCategory.ALL, "");
        Intl.bindtextdomain (welcome.GETTEXT_PACKAGE, welcome.LOCALEDIR);
        Intl.bind_textdomain_codeset (welcome.GETTEXT_PACKAGE, "UTF-8");
        Intl.textdomain (welcome.GETTEXT_PACKAGE);
    }

    public override void activate () {
        if (Posix.getuid () < MIN_UID) {
            quit ();
        }

        var window = new MainWindow () {
            application = this
        };
        window.present ();
    }
}

public static int main (string[] args) {
    var application = new welcome.App ();
    return application.run (args);
}

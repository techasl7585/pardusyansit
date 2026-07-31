import Gio from 'gi://Gio';
import GObject from 'gi://GObject';
import Shell from 'gi://Shell';

import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import * as QuickSettings from 'resource:///org/gnome/shell/ui/quickSettings.js';
import {Extension, gettext as _} from 'resource:///org/gnome/shell/extensions/extension.js';

const APP_DESKTOP_ID = 'org.gnome.NetworkDisplays.desktop';

function launchDesktopApp() {
    const app = Shell.AppSystem.get_default().lookup_app(APP_DESKTOP_ID);

    if (app) {
        app.activate();
        return;
    }

    try {
        Gio.Subprocess.new(
            ['/usr/bin/pardus-yansit'],
            Gio.SubprocessFlags.NONE
        );
    } catch (error) {
        console.error(`Pardus Yansıt başlatılamadı: ${error.message}`);
    }
}

function launchSystemCheck() {
    try {
        Gio.Subprocess.new(
            ['/usr/bin/pardus-yansit', '--check-gui'],
            Gio.SubprocessFlags.NONE
        );
    } catch (error) {
        console.error(`Pardus Yansıt sistem denetimi başlatılamadı: ${error.message}`);
    }
}

const PardusYansitToggle = GObject.registerClass(
class PardusYansitToggle extends QuickSettings.QuickMenuToggle {
    constructor() {
        super({
            title: _('Yansıt'),
            subtitle: _('Kablosuz ekran'),
            iconName: 'pardus-yansit-symbolic',
            toggleMode: false,
        });

        this.menu.setHeader(
            'pardus-yansit-symbolic',
            _('Pardus Yansıt'),
            _('Kablosuz ekran paylaşımı')
        );

        this.menu.addAction(_('Pardus Yansıt’ı aç'), launchDesktopApp);
        this.menu.addAction(_('Sistem uygunluğunu kontrol et'), launchSystemCheck);

        this.connect('clicked', launchDesktopApp);
    }
});

const PardusYansitIndicator = GObject.registerClass(
class PardusYansitIndicator extends QuickSettings.SystemIndicator {
    constructor() {
        super();
        this.quickSettingsItems.push(new PardusYansitToggle());
    }

    destroy() {
        this.quickSettingsItems.forEach(item => item.destroy());
        super.destroy();
    }
});

export default class PardusYansitExtension extends Extension {
    enable() {
        this._indicator = new PardusYansitIndicator();
        Main.panel.statusArea.quickSettings.addExternalIndicator(this._indicator);
    }

    disable() {
        this._indicator?.destroy();
        this._indicator = null;
    }
}


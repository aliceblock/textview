package me.intception.textview

import io.flutter.plugin.common.PluginRegistry.Registrar

class TextviewPlugin {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            registrar
                .platformViewRegistry()
                .registerViewFactory("me.intception.textview", TextviewFactory(registrar))
        }
    }
}
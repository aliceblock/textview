package me.intception.textview

import android.content.Context
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class TextviewFactory(private val registrar: Registrar): PlatformViewFactory(StandardMessageCodec()) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return MyTextview(registrar, viewId, args.toString())
    }
}
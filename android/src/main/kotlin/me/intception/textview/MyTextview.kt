package me.intception.textview

import android.view.Gravity
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.platform.PlatformView

class MyTextview(registrar: Registrar, viewId: Int, defaultText: String): PlatformView, MethodCallHandler {
    private val textView: TextView = getTextView(registrar, defaultText)
    private val channel = MethodChannel(registrar.messenger(), "me.intception.textview/$viewId")

    init {
        channel.setMethodCallHandler(this)
    }

    private fun getTextView(registrar: Registrar, text: String): TextView {
        val textView = TextView(registrar.context())
        textView.text = text
        // จัด TextView ไว้กึ่งกลางด้วยการตั้งค่า gravity
        textView.gravity = Gravity.CENTER
        return textView
    }

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "setText" -> {
                val text = call.arguments.toString()
                textView.text = text
            }
            else -> result.notImplemented()
        }
    }
}
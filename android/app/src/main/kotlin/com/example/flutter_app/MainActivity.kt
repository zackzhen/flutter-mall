package com.example.flutter_app

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "zack.zack.team"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = 0
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel.setMethodCallHandler { call, result ->
            when(call.method){
                "jumpActivity" ->{
                    Log.e("FlutterActivity","jumpActivity")
                    startActivity(Intent(context,AboutOurAcy::class.java))
                }
                "toastMsg" ->{
                    Log.e("FlutterActivity","toastMsg")
                    Toast.makeText(context,"hello",Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
}

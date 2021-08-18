package com.example.flutter_app

import android.content.Context
import androidx.multidex.MultiDexApplication

class BaseApplication : MultiDexApplication(){

    override fun onCreate() {
        super.onCreate()
    }

    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
    }
}
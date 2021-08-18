package com.example.flutter_app

import android.app.Activity
import android.graphics.Color
import android.os.Bundle
import android.view.Gravity
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.Toast
import org.jetbrains.anko.*

class AboutOurAcy : Activity(){

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        title = "关于我们"
        linearLayout {
            orientation = LinearLayout.VERTICAL
            textView("666"){
                textSize = 20f
                textColor = Color.GRAY
                gravity = Gravity.CENTER_HORIZONTAL
//                width = ViewGroup.LayoutParams.MATCH_PARENT
            }
            imageView(R.mipmap.ic_launcher){

                setOnClickListener {
                    Toast.makeText(context,"hello",Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
}
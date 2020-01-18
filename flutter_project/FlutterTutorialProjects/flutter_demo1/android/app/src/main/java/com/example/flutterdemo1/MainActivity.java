package com.example.flutterdemo1;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;

import java.util.Map;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    public static final String CHANNEL = "MyChannel";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
       // MultiDex.install(this);
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);


        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

                Map<String, Object> params = (Map<String, Object>) methodCall.arguments;

                if(methodCall.method.equals("myNativeFunction")){
                    String messageToFlutter = myNativeFunction();
                    String fromParam = params.get("from").toString();
                    result.success(messageToFlutter + ", Back to " + fromParam);
                }else{
                    result.notImplemented();
                }
            }
        });

    }

    String myNativeFunction(){
        return "Message From Android";
    }

}

package com.syriasell.syria_sell;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "syriasell.deep_link";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        handleIntent(getIntent());
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        handleIntent(intent);
    }

    private void handleIntent(Intent intent) {
        if (intent != null) {
            Uri data = intent.getData();
            if (data != null && getFlutterEngine() != null) {
                try {
                    new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL)
                            .invokeMethod("onDeepLink", data.toString());
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


/*
package com.syriasell.syria_sell;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
}
*/
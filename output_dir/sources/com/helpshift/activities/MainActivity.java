package com.helpshift.activities;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import androidx.appcompat.app.AppCompatActivity;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.util.AssetsUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.LocaleContextUtil;
import com.helpshift.util.concurrent.ApiExecutorFactory;

/* JADX INFO: loaded from: classes.dex */
public class MainActivity extends AppCompatActivity {
    public static final String SHOW_IN_FULLSCREEN = "showInFullScreen";
    private static final String TAG = "Helpshift_MainActvty";

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!HelpshiftContext.installCallSuccessful.get()) {
            Log.d(TAG, "Helpshift install is not successful yet.");
            if (HelpshiftContext.verifyInstall()) {
                Log.d(TAG, "Waiting for install call to finish");
                ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
                if (!HelpshiftContext.installCallSuccessful.get()) {
                    Log.d(TAG, "Helpshift install unsuccessful after waiting.");
                    return;
                }
            } else {
                Log.d(TAG, "Helpshift install is not called yet.");
                return;
            }
        }
        if (Build.VERSION.SDK_INT < 30 && getIntent().getBooleanExtra(SHOW_IN_FULLSCREEN, false)) {
            getWindow().setFlags(1024, 1024);
        }
        try {
            Integer num = InfoModelFactory.getInstance().appInfoModel.screenOrientation;
            if (num != null && num.intValue() != -1) {
                setRequestedOrientation(num.intValue());
            }
        } catch (Exception e) {
            HSLogger.e(TAG, "Unable to set the requested orientation : " + e.getMessage());
        }
        Integer theme = InfoModelFactory.getInstance().sdkInfoModel.getTheme();
        if (AssetsUtil.resourceExists(this, theme)) {
            setTheme(theme.intValue());
        }
    }

    @Override // androidx.appcompat.app.AppCompatActivity, android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        if (HelpshiftContext.installCallSuccessful.get()) {
            context = LocaleContextUtil.getContextWithUpdatedLocale(context);
        }
        super.attachBaseContext(context);
    }
}

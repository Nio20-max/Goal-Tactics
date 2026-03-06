package com.helpshift.executors;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import com.helpshift.R;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.views.HSToast;

/* JADX INFO: loaded from: classes2.dex */
public class CampaignActionExecutor implements ActionExecutor {
    private static final long serialVersionUID = 8355546788901425397L;

    /* JADX INFO: renamed from: com.helpshift.executors.CampaignActionExecutor$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$enums$ACTION_TYPE;

        static {
            int[] iArr = new int[ACTION_TYPE.values().length];
            $SwitchMap$com$helpshift$enums$ACTION_TYPE = iArr;
            try {
                iArr[ACTION_TYPE.OPEN_DEEP_LINK.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.LAUNCH_APP.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    @Override // com.helpshift.executors.ActionExecutor
    public void executeAction(Activity activity, ACTION_TYPE action_type, String str) {
        Intent launchIntent;
        if (AnonymousClass1.$SwitchMap$com$helpshift$enums$ACTION_TYPE[action_type.ordinal()] == 1) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(str));
            try {
                activity.startActivity(intent);
                return;
            } catch (Exception unused) {
                HSToast.makeText(activity, activity.getResources().getString(R.string.hs__could_not_open_attachment_msg), 0).show();
                return;
            }
        }
        if (HSAppLifeCycleController.getInstance().isAppInForeground() || (launchIntent = ApplicationUtil.getLaunchIntent(activity.getApplicationContext(), activity.getPackageName())) == null) {
            return;
        }
        activity.startActivity(launchIntent);
    }
}

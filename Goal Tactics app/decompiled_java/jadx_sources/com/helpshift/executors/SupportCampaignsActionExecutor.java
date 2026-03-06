package com.helpshift.executors;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import com.helpshift.R;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.support.Support;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.views.HSToast;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class SupportCampaignsActionExecutor implements ActionExecutor {
    private static final long serialVersionUID = 4544014913056857162L;

    /* JADX INFO: renamed from: com.helpshift.executors.SupportCampaignsActionExecutor$1, reason: invalid class name */
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
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_FAQS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_FAQ_SECTION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_CONVERSATION.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_SINGLE_FAQ.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_ALERT_TO_RATE_APP.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.LAUNCH_APP.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    @Override // com.helpshift.executors.ActionExecutor
    public void executeAction(Activity activity, ACTION_TYPE action_type, String str) {
        Intent launchIntent;
        switch (AnonymousClass1.$SwitchMap$com$helpshift$enums$ACTION_TYPE[action_type.ordinal()]) {
            case 1:
                Intent intent = new Intent("android.intent.action.VIEW");
                intent.setData(Uri.parse(str));
                try {
                    activity.startActivity(intent);
                } catch (Exception unused) {
                    HSToast.makeText(activity, activity.getResources().getString(R.string.hs__could_not_open_attachment_msg), 0).show();
                }
                break;
            case 2:
                Support.showFAQs(activity);
                break;
            case 3:
                Support.showFAQSection(activity, str);
                break;
            case 4:
                HashMap map = new HashMap();
                map.put(SDKConfigurationDM.CONVERSATION_PRE_FILL_TEXT, str);
                Support.showConversation(activity, map);
                break;
            case 5:
                Support.showSingleFAQ(activity, str);
                break;
            case 6:
                Support.showAlertToRateApp(str, null);
                break;
            default:
                if (!HSAppLifeCycleController.getInstance().isAppInForeground() && (launchIntent = ApplicationUtil.getLaunchIntent(activity.getApplicationContext(), activity.getPackageName())) != null) {
                    activity.startActivity(launchIntent);
                    break;
                }
                break;
        }
    }
}

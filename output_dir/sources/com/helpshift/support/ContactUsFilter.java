package com.helpshift.support;

import android.content.Context;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.SupportInternal;
import com.helpshift.util.HelpshiftContext;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public final class ContactUsFilter {
    private static HSApiData data;
    private static Integer enableContactUs;

    public enum LOCATION {
        ACTION_BAR,
        SEARCH_FOOTER,
        QUESTION_FOOTER,
        QUESTION_ACTION_BAR,
        SEARCH_RESULT_ACTIVITY_HEADER
    }

    public static void init(Context context) {
        if (data == null) {
            data = new HSApiData(context);
            enableContactUs = Integer.valueOf(HelpshiftContext.getCoreApi().getSDKConfigurationDM().getEnableContactUs().getValue());
        }
    }

    protected static void setConfig(HashMap map) {
        if (map == null) {
            map = new HashMap();
        }
        Object obj = map.get(SDKConfigurationDM.ENABLE_CONTACT_US);
        if (obj instanceof Integer) {
            enableContactUs = (Integer) map.get(SDKConfigurationDM.ENABLE_CONTACT_US);
        } else if (obj instanceof Boolean) {
            if (((Boolean) obj).booleanValue()) {
                enableContactUs = SupportInternal.EnableContactUs.ALWAYS;
            } else {
                enableContactUs = SupportInternal.EnableContactUs.NEVER;
            }
        }
    }

    public static boolean showContactUs(LOCATION location) {
        if (location == LOCATION.SEARCH_RESULT_ACTIVITY_HEADER || SupportInternal.EnableContactUs.NEVER.equals(enableContactUs)) {
            return false;
        }
        if (!SupportInternal.EnableContactUs.ALWAYS.equals(enableContactUs) && location != LOCATION.QUESTION_FOOTER) {
            if (location == LOCATION.ACTION_BAR) {
                return HelpshiftContext.getCoreApi().getActiveConversation() != null;
            }
            if (!SupportInternal.EnableContactUs.AFTER_VIEWING_FAQS.equals(enableContactUs) && SupportInternal.EnableContactUs.AFTER_MARKING_ANSWER_UNHELPFUL.equals(enableContactUs)) {
                int i = AnonymousClass1.$SwitchMap$com$helpshift$support$ContactUsFilter$LOCATION[location.ordinal()];
                if (i != 1) {
                    return (i == 2 && HelpshiftContext.getCoreApi().getActiveConversation() == null) ? false : true;
                }
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: renamed from: com.helpshift.support.ContactUsFilter$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$support$ContactUsFilter$LOCATION;

        static {
            int[] iArr = new int[LOCATION.values().length];
            $SwitchMap$com$helpshift$support$ContactUsFilter$LOCATION = iArr;
            try {
                iArr[LOCATION.SEARCH_FOOTER.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$support$ContactUsFilter$LOCATION[LOCATION.QUESTION_ACTION_BAR.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }
}

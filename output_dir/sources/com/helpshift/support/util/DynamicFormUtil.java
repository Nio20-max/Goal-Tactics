package com.helpshift.support.util;

import android.content.Context;
import com.helpshift.support.flows.ConversationFlow;
import com.helpshift.support.flows.DynamicFormFlow;
import com.helpshift.support.flows.FAQSectionFlow;
import com.helpshift.support.flows.FAQsFlow;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.flows.SingleFAQFlow;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DynamicFormUtil {
    public static List<Flow> toFlowList(Context context, List<HashMap<String, Object>> list) {
        ArrayList arrayList = new ArrayList();
        Iterator<HashMap<String, Object>> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(toFlow(context, it.next()));
        }
        return arrayList;
    }

    public static Flow toFlow(Context context, HashMap map) {
        Flow dynamicFormFlow;
        String str = (String) map.get("type");
        HashMap map2 = new HashMap();
        if (map.containsKey("config")) {
            map2 = (HashMap) map.get("config");
        }
        String str2 = (String) map.get("titleResourceName");
        int identifier = str2 != null ? context.getResources().getIdentifier(str2, "string", context.getPackageName()) : 0;
        String str3 = identifier == 0 ? (String) map.get("title") : "";
        if (str.equals("faqsFlow")) {
            if (identifier != 0) {
                return new FAQsFlow(identifier, map2);
            }
            return new FAQsFlow(str3, map2);
        }
        if (str.equals("conversationFlow")) {
            if (identifier != 0) {
                return new ConversationFlow(identifier, map2);
            }
            return new ConversationFlow(str3, map2);
        }
        if (str.equals("faqSectionFlow")) {
            String str4 = (String) map.get("data");
            if (identifier != 0) {
                dynamicFormFlow = new FAQSectionFlow(identifier, str4, map2);
            } else {
                dynamicFormFlow = new FAQSectionFlow(str3, str4, map2);
            }
        } else if (str.equals("singleFaqFlow")) {
            String str5 = (String) map.get("data");
            if (identifier != 0) {
                dynamicFormFlow = new SingleFAQFlow(identifier, str5, map2);
            } else {
                dynamicFormFlow = new SingleFAQFlow(str3, str5, map2);
            }
        } else {
            if (!str.equals("dynamicFormFlow")) {
                return null;
            }
            List<Flow> flowList = toFlowList(context, (ArrayList) map.get("data"));
            if (identifier != 0) {
                dynamicFormFlow = new DynamicFormFlow(identifier, flowList);
            } else {
                dynamicFormFlow = new DynamicFormFlow(str3, flowList);
            }
        }
        return dynamicFormFlow;
    }
}

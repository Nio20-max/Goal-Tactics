package com.helpshift.xamarin.util;

import android.content.Context;
import android.util.Log;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.ApiConfig;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.Metadata;
import com.helpshift.support.Support;
import com.helpshift.support.flows.ConversationFlow;
import com.helpshift.support.flows.DynamicFormFlow;
import com.helpshift.support.flows.FAQSectionFlow;
import com.helpshift.support.flows.FAQsFlow;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.flows.SingleFAQFlow;
import com.helpshift.support.util.DynamicFormUtil;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.xamarin.flows.HelpshiftConversationFlow;
import com.helpshift.xamarin.flows.HelpshiftDynamicFormFlow;
import com.helpshift.xamarin.flows.HelpshiftFAQSectionFlow;
import com.helpshift.xamarin.flows.HelpshiftFAQsFlow;
import com.helpshift.xamarin.flows.HelpshiftSingleFaqFlow;
import com.helpshift.xamarin.support.HelpshiftAPIConfig;
import com.helpshift.xamarin.support.HelpshiftFAQFilter;
import com.helpshift.xamarin.support.HelpshiftSupportMetadata;
import com.helpshift.xamarin.support.HsEnableContactUs;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ConfigParserUtil {
    private static final String TAG = "ConfigParserUtil";

    public static Map parseConfigDictionary(Context context, String str) throws JSONException {
        return parseConfigDictionary(context, HSJSONUtils.toMap(new JSONObject(str)));
    }

    public static Map parseConfigDictionary(Context context, Map map) {
        if (map == null) {
            return new HashMap();
        }
        if (map.get(SDKConfigurationDM.ENABLE_CONTACT_US) != null) {
            if (map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("yes") || map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("always")) {
                map.put(SDKConfigurationDM.ENABLE_CONTACT_US, Support.EnableContactUs.ALWAYS);
            } else if (map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("no") || map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("never")) {
                map.put(SDKConfigurationDM.ENABLE_CONTACT_US, Support.EnableContactUs.NEVER);
            } else if (map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("after_viewing_faqs")) {
                map.put(SDKConfigurationDM.ENABLE_CONTACT_US, Support.EnableContactUs.AFTER_VIEWING_FAQS);
            } else if (map.get(SDKConfigurationDM.ENABLE_CONTACT_US).equals("after_marking_answer_unhelpful")) {
                map.put(SDKConfigurationDM.ENABLE_CONTACT_US, Support.EnableContactUs.AFTER_MARKING_ANSWER_UNHELPFUL);
            }
        }
        HashSet hashSet = new HashSet();
        hashSet.add(SDKConfigurationDM.ENABLE_IN_APP_NOTIFICATION);
        hashSet.add(SDKConfigurationDM.REQUIRE_EMAIL);
        hashSet.add(SDKConfigurationDM.HIDE_NAME_AND_EMAIL);
        hashSet.add("enableFullPrivacy");
        hashSet.add(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION);
        hashSet.add(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US);
        hashSet.add(SDKConfigurationDM.SHOW_CONVERSATION_RESOLUTION_QUESTION_API);
        hashSet.add("enableDefaultFallbackLanguage");
        hashSet.add(SDKConfigurationDM.SHOW_CONVERSATION_INFO_SCREEN);
        hashSet.add(SDKConfigurationDM.ENABLE_TYPING_INDICATOR);
        Map mapReplaceWithBoolean = replaceWithBoolean(hashSet, map);
        HashMap map2 = (HashMap) mapReplaceWithBoolean.get("hs-custom-metadata");
        if (map2 != null) {
            ArrayList arrayList = (ArrayList) map2.get(Support.TagsKey);
            if (arrayList != null && arrayList.size() > 0) {
                map2.put(Support.TagsKey, (String[]) arrayList.toArray(new String[arrayList.size()]));
            }
            mapReplaceWithBoolean.put("hs-custom-metadata", map2);
        }
        HashMap map3 = new HashMap();
        HashMap map4 = (HashMap) mapReplaceWithBoolean.remove(Support.CustomIssueFieldKey);
        if (map4 != null && map4.size() > 0) {
            for (Map.Entry entry : map4.entrySet()) {
                if (entry.getValue() != null) {
                    map3.put(entry.getKey(), ((ArrayList) entry.getValue()).toArray(new String[((ArrayList) entry.getValue()).size()]));
                }
            }
        }
        if (map3.size() > 0) {
            mapReplaceWithBoolean.put(Support.CustomIssueFieldKey, map3);
        }
        HashMap map5 = (HashMap) mapReplaceWithBoolean.get("withTagsMatching");
        if (map5 != null) {
            ArrayList arrayList2 = (ArrayList) map5.get("tags");
            if (arrayList2 != null && arrayList2.size() > 0) {
                map5.put("tags", (String[]) arrayList2.toArray(new String[arrayList2.size()]));
            }
            mapReplaceWithBoolean.put("withTagsMatching", map5);
        }
        List flowListForKey = parseFlowListForKey(context, mapReplaceWithBoolean, "customContactUsFlows");
        if (flowListForKey != null) {
            mapReplaceWithBoolean.put("customContactUsFlows", flowListForKey);
        }
        return mapReplaceWithBoolean;
    }

    private static List parseFlowListForKey(Context context, Map map, String str) {
        List list;
        try {
            list = (List) map.get(str);
        } catch (ClassCastException e) {
            Log.i(TAG, "parseFlowListForKey", e);
            list = null;
        }
        if (list != null) {
            return parseFlowList(context, list);
        }
        return null;
    }

    public static List parseFlowList(Context context, List<HashMap<String, Object>> list) {
        for (HashMap<String, Object> map : list) {
            if ("dynamicFormFlow".equals((String) map.get("type"))) {
                parseFlowListForKey(context, map, "data");
            } else {
                map.put("config", parseConfigDictionary(context, (HashMap) map.get("config")));
            }
        }
        return DynamicFormUtil.toFlowList(context, list);
    }

    public static Map replaceWithBoolean(HashSet hashSet, Map map) {
        Iterator it = hashSet.iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            Object obj = map.get(str);
            if (obj instanceof String) {
                if (obj.toString().equals("yes")) {
                    map.put(str, true);
                } else if (obj.toString().equals("no")) {
                    map.put(str, false);
                }
            }
        }
        return map;
    }

    private static Map<String, String[]> convertObjectToStringArray(Map<String, Object> map) {
        HashMap map2 = new HashMap();
        if (map != null && map.size() > 0) {
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                if (entry.getValue() instanceof List) {
                    ArrayList arrayList = (ArrayList) entry.getValue();
                    map2.put(entry.getKey(), arrayList.toArray(new String[arrayList.size()]));
                }
            }
        }
        return map2;
    }

    private static FaqTagFilter buildFaqTagFilter(HelpshiftFAQFilter helpshiftFAQFilter) {
        if (helpshiftFAQFilter != null) {
            return new FaqTagFilter(helpshiftFAQFilter.operator, helpshiftFAQFilter.tags);
        }
        return null;
    }

    public static Metadata buildMetadata(HelpshiftSupportMetadata helpshiftSupportMetadata) {
        if (helpshiftSupportMetadata != null) {
            try {
                HashMap<String, Object> map = HSJSONUtils.toMap(new JSONObject(helpshiftSupportMetadata.metadataJson));
                String[] strArr = helpshiftSupportMetadata.issueTags;
                if (strArr == null || (strArr.length == 0 && map.containsKey(Support.TagsKey))) {
                    ArrayList arrayList = (ArrayList) map.remove(Support.TagsKey);
                    if (arrayList.size() > 0) {
                        strArr = (String[]) arrayList.toArray(new String[arrayList.size()]);
                    }
                }
                return new Metadata(map, strArr);
            } catch (JSONException e) {
                Log.d(TAG, "buildMetadata", e);
            }
        }
        return null;
    }

    private static Map<String, String[]> buildCustomIssueFields(String str) {
        try {
            return convertObjectToStringArray(HSJSONUtils.toMap(new JSONObject(str)));
        } catch (JSONException e) {
            Log.d(TAG, "buildCustomIssueFields", e);
            return null;
        }
    }

    private static Map<String, Object> buildExtras(String str) {
        try {
            return HSJSONUtils.toMap(new JSONObject(str));
        } catch (JSONException e) {
            Log.d(TAG, "buildExtras", e);
            return null;
        }
    }

    public static List<Flow> buildFlows(List<com.helpshift.xamarin.flows.Flow> list) {
        ArrayList arrayList = new ArrayList();
        if (list != null && list.size() > 0) {
            for (com.helpshift.xamarin.flows.Flow flow : list) {
                if (flow instanceof HelpshiftDynamicFormFlow) {
                    arrayList.add(new DynamicFormFlow(flow.getLabel(), buildFlows(((HelpshiftDynamicFormFlow) flow).getFlows())));
                } else if (flow instanceof HelpshiftFAQsFlow) {
                    arrayList.add(new FAQsFlow(flow.getLabel(), buildApiConfig(flow.getApiConfig())));
                } else if (flow instanceof HelpshiftFAQSectionFlow) {
                    HelpshiftFAQSectionFlow helpshiftFAQSectionFlow = (HelpshiftFAQSectionFlow) flow;
                    arrayList.add(new FAQSectionFlow(helpshiftFAQSectionFlow.getLabel(), helpshiftFAQSectionFlow.getSectionPublishId(), buildApiConfig(helpshiftFAQSectionFlow.getApiConfig())));
                } else if (flow instanceof HelpshiftSingleFaqFlow) {
                    HelpshiftSingleFaqFlow helpshiftSingleFaqFlow = (HelpshiftSingleFaqFlow) flow;
                    arrayList.add(new SingleFAQFlow(helpshiftSingleFaqFlow.getLabel(), helpshiftSingleFaqFlow.getFaqPublishId(), buildApiConfig(helpshiftSingleFaqFlow.getApiConfig())));
                } else if (flow instanceof HelpshiftConversationFlow) {
                    arrayList.add(new ConversationFlow(flow.getLabel(), buildApiConfig(flow.getApiConfig())));
                }
            }
        }
        return arrayList;
    }

    private static Integer convertHsEnableContactUsValueToNativeValue(HsEnableContactUs hsEnableContactUs) {
        if (hsEnableContactUs == null) {
            return Support.EnableContactUs.ALWAYS;
        }
        int i = AnonymousClass1.$SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs[hsEnableContactUs.ordinal()];
        if (i == 1) {
            return Support.EnableContactUs.ALWAYS;
        }
        if (i == 2) {
            return Support.EnableContactUs.AFTER_VIEWING_FAQS;
        }
        if (i == 3) {
            return Support.EnableContactUs.AFTER_MARKING_ANSWER_UNHELPFUL;
        }
        if (i == 4) {
            return Support.EnableContactUs.NEVER;
        }
        return Support.EnableContactUs.ALWAYS;
    }

    /* JADX INFO: renamed from: com.helpshift.xamarin.util.ConfigParserUtil$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs;

        static {
            int[] iArr = new int[HsEnableContactUs.values().length];
            $SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs = iArr;
            try {
                iArr[HsEnableContactUs.ALWAYS.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs[HsEnableContactUs.AFTER_VIEWING_FAQS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs[HsEnableContactUs.AFTER_MARKING_ANSWER_UNHELPFUL.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs[HsEnableContactUs.NEVER.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    public static ApiConfig buildApiConfig(HelpshiftAPIConfig helpshiftAPIConfig) {
        if (helpshiftAPIConfig != null) {
            return new ApiConfig.Builder().setEnableContactUs(convertHsEnableContactUsValueToNativeValue(helpshiftAPIConfig.enableContactUs)).setGotoConversationAfterContactUs(helpshiftAPIConfig.gotoConversationAfterContactUs).setRequireEmail(helpshiftAPIConfig.requireEmail).setHideNameAndEmail(helpshiftAPIConfig.hideNameAndEmail).setConversationPrefillText(helpshiftAPIConfig.conversationPrefillText).setEnableFullPrivacy(helpshiftAPIConfig.enableFullPrivacy).setShowSearchOnNewConversation(helpshiftAPIConfig.showSearchOnNewConversation).setShowConversationResolutionQuestion(helpshiftAPIConfig.showConversationResolutionQuestion).setCustomContactUsFlows(buildFlows(helpshiftAPIConfig.customContactUsFlows)).setWithTagsMatching(buildFaqTagFilter(helpshiftAPIConfig.withTagsMatching)).setShowConversationInfoScreen(helpshiftAPIConfig.showConversationInfoScreen).setEnableTypingIndicator(helpshiftAPIConfig.enableTypingIndicator).setCustomIssueFields(buildCustomIssueFields(helpshiftAPIConfig.customIssueFieldsJson)).setExtras(buildExtras(helpshiftAPIConfig.extrasJson)).setCustomMetadata(buildMetadata(helpshiftAPIConfig.customMetadata)).build();
        }
        return null;
    }
}

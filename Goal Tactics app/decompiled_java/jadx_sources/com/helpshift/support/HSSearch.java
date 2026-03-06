package com.helpshift.support;

import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.campaigns.models.PropertyValue;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.support.external.DoubleMetaphone;
import com.helpshift.support.model.FaqSearchIndex;
import com.helpshift.support.model.FuzzySearchToken;
import com.helpshift.support.model.TfIdfSearchToken;
import com.helpshift.support.search.SearchTokenDao;
import com.helpshift.support.search.SearchTokenDto;
import com.helpshift.support.search.storage.SearchTokenDaoImpl;
import com.helpshift.support.search.tfidf.PageIndexTrie;
import com.helpshift.support.util.HSTransliterator;
import com.helpshift.util.HtmlUtil;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public final class HSSearch {
    private static HashMap<String, String[]> characterTable;
    private static final Pattern patternGenerateToken = Pattern.compile("[a-zA-Z0-9]+");
    private static DoubleMetaphone metaPhone = new DoubleMetaphone();
    private static boolean indexing = false;
    private static boolean markDeinit = false;

    public enum HS_SEARCH_OPTIONS {
        FULL_SEARCH,
        METAPHONE_SEARCH,
        KEYWORD_SEARCH
    }

    public static int calcFreq(int i, int i2) {
        if (i == 1) {
            return 5;
        }
        if (40 == i2) {
            return i;
        }
        if (10 == i2) {
            return 30;
        }
        if (50 == i2) {
            return 1;
        }
        if (20 == i2) {
            return 300;
        }
        if (30 == i2) {
            return IronSourceConstants.REWARDED_VIDEO_DAILY_CAPPED;
        }
        return 1;
    }

    public static int getTermWeight(int i) {
        if (i == 20) {
            return 5;
        }
        return i == 30 ? 3 : 1;
    }

    private static boolean isMetaTypeMatching(int i, int i2) {
        return !(50 == i || 50 == i2) || i == i2;
    }

    private static int smallestOf(int i, int i2) {
        return i2 < i ? i2 : i;
    }

    private static int smallestOf(int i, int i2, int i3) {
        if (i2 < i) {
            i = i2;
        }
        return i3 < i ? i3 : i;
    }

    public static void init() {
        if (indexing) {
            return;
        }
        Thread thread = new Thread(new Runnable() { // from class: com.helpshift.support.HSSearch.1
            @Override // java.lang.Runnable
            public void run() {
                HSTransliterator.init();
            }
        }, "HS-trnsltrtr");
        thread.setDaemon(true);
        thread.start();
    }

    public static void deinit() {
        if (!indexing) {
            HSTransliterator.deinit();
        } else {
            markDeinit = true;
        }
        characterTable = null;
    }

    public static String escapeHtml(String str) {
        return HtmlUtil.fromHtml(str).toString();
    }

    public static String stripHtml(String str) {
        return str.replaceAll("<[^<>]+>", "");
    }

    public static ArrayList<String> generateTokens(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        Matcher matcher = patternGenerateToken.matcher(str);
        while (matcher.find()) {
            if (matcher.group(0).length() > 2) {
                arrayList.add(matcher.group(0));
            }
        }
        return arrayList;
    }

    public static ArrayList<String> generateTokensForSearchQuery(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        Matcher matcher = patternGenerateToken.matcher(str);
        while (matcher.find()) {
            if (matcher.group(0).length() > 2 || str.length() > 2) {
                arrayList.add(matcher.group(0));
            }
        }
        return arrayList;
    }

    public static ArrayList<TfIdfSearchToken> generateVariations(String str, int i) {
        HashSet hashSet = new HashSet();
        hashSet.add(new TfIdfSearchToken(str, i));
        String strDoubleMetaphone = metaPhone.doubleMetaphone(str, false);
        if (strDoubleMetaphone != null) {
            hashSet.add(new TfIdfSearchToken(strDoubleMetaphone.toLowerCase(), 50));
        }
        return new ArrayList<>(hashSet);
    }

    public static ArrayList<TfIdfSearchToken> generateSearchVariations(String str) {
        return generateVariations(str, 10);
    }

    public static String sanitize(String str) {
        return HSTransliterator.unidecode(escapeHtml(stripHtml(str)).toLowerCase());
    }

    private static void buildPageIndexTrie(PageIndexTrie pageIndexTrie, String str, String str2, List<String> list, int i) {
        generateAndAddString(pageIndexTrie, generateTokens(sanitize(str)), 20, i);
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            arrayList.addAll(generateTokens(sanitize(it.next())));
        }
        generateAndAddString(pageIndexTrie, arrayList, 30, i);
        generateAndAddString(pageIndexTrie, generateTokens(sanitize(str2)), 10, i);
    }

    private static void generateAndAddString(PageIndexTrie pageIndexTrie, List<String> list, int i, int i2) {
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            for (TfIdfSearchToken tfIdfSearchToken : generateVariations(it.next(), i)) {
                pageIndexTrie.insert(tfIdfSearchToken.value, tfIdfSearchToken.type, i2);
            }
        }
    }

    public static FaqSearchIndex indexDocuments(ArrayList<Faq> arrayList) {
        if (indexing) {
            return null;
        }
        if (!HSTransliterator.isLoaded()) {
            HSTransliterator.init();
            markDeinit = true;
        }
        indexing = true;
        Map<String, List<FuzzySearchToken>> mapBuildFuzzyIndex = buildFuzzyIndex(arrayList);
        buildTfidfIndex(arrayList);
        FaqSearchIndex faqSearchIndex = new FaqSearchIndex(mapBuildFuzzyIndex);
        indexing = false;
        if (markDeinit) {
            deinit();
            markDeinit = false;
        }
        return faqSearchIndex;
    }

    protected static ArrayList<TfIdfSearchToken> filterSearchQuery(ArrayList<TfIdfSearchToken> arrayList, HS_SEARCH_OPTIONS hs_search_options) {
        ArrayList<TfIdfSearchToken> arrayList2 = new ArrayList<>();
        for (TfIdfSearchToken tfIdfSearchToken : arrayList) {
            int i = tfIdfSearchToken.type;
            if (hs_search_options == HS_SEARCH_OPTIONS.FULL_SEARCH) {
                arrayList2.add(tfIdfSearchToken);
            } else if (hs_search_options == HS_SEARCH_OPTIONS.METAPHONE_SEARCH && 50 == i) {
                arrayList2.add(tfIdfSearchToken);
            } else if (hs_search_options == HS_SEARCH_OPTIONS.KEYWORD_SEARCH && (10 == i || 40 == i)) {
                arrayList2.add(tfIdfSearchToken);
            }
        }
        return arrayList2;
    }

    public static ArrayList<HashMap> queryDocs(String str, HS_SEARCH_OPTIONS hs_search_options) {
        HashMap map = new HashMap();
        HashMap map2 = new HashMap();
        ArrayList<TfIdfSearchToken> arrayList = new ArrayList();
        Iterator<String> it = generateTokensForSearchQuery(sanitize(str)).iterator();
        while (it.hasNext()) {
            arrayList.addAll(filterSearchQuery(generateSearchVariations(it.next()), hs_search_options));
        }
        SearchTokenDao searchTokenDaoImpl = SearchTokenDaoImpl.getInstance();
        HashSet<String> hashSet = null;
        if (searchTokenDaoImpl != null) {
            for (TfIdfSearchToken tfIdfSearchToken : arrayList) {
                String str2 = tfIdfSearchToken.value;
                int i = tfIdfSearchToken.type;
                SearchTokenDto searchTokenDto = searchTokenDaoImpl.get(str2);
                if (searchTokenDto != null && isMetaTypeMatching(searchTokenDto.wordType, tfIdfSearchToken.type)) {
                    Map<Integer, Double> map3 = searchTokenDto.scoreMap;
                    HashMap map4 = new HashMap();
                    for (Map.Entry<Integer, Double> entry : map3.entrySet()) {
                        map4.put(String.valueOf(entry.getKey()), entry.getValue());
                    }
                    if (!map4.isEmpty()) {
                        for (Map.Entry entry2 : map4.entrySet()) {
                            String str3 = (String) entry2.getKey();
                            ArrayList arrayList2 = (ArrayList) map2.get(str3);
                            if (arrayList2 == null) {
                                arrayList2 = new ArrayList();
                            }
                            if (str2.length() > 0) {
                                arrayList2.add(str2);
                            }
                            map2.put(str3, arrayList2);
                            Double d = (Double) entry2.getValue();
                            Double d2 = (Double) map.get(str3);
                            Double dValueOf = Double.valueOf(d.doubleValue() * ((double) calcFreq(str2.length(), i)));
                            if (d2 != null) {
                                map.put(str3, Double.valueOf(d2.doubleValue() + dValueOf.doubleValue()));
                            } else {
                                map.put(str3, dValueOf);
                            }
                        }
                        HashSet hashSet2 = new HashSet(map4.keySet());
                        if (hashSet != null && !hashSet.isEmpty()) {
                            hashSet.addAll(hashSet2);
                        } else {
                            hashSet = new HashSet(hashSet2);
                        }
                    }
                }
            }
        }
        if (hashSet == null || hashSet.isEmpty()) {
            TreeMap treeMap = new TreeMap(new RankComparator(map));
            treeMap.putAll(map);
            return sortMatchedTermsMap(treeMap, map2);
        }
        if (hashSet.size() == 1) {
            HashMap map5 = new HashMap();
            ArrayList<HashMap> arrayList3 = new ArrayList<>();
            String str4 = (String) hashSet.iterator().next();
            map5.put("f", str4);
            map5.put("t", map2.get(str4));
            arrayList3.add(map5);
            return arrayList3;
        }
        HashMap map6 = new HashMap();
        for (String str5 : hashSet) {
            map6.put(str5, map.get(str5));
        }
        TreeMap treeMap2 = new TreeMap(new RankComparator(map6));
        treeMap2.putAll(map6);
        return sortMatchedTermsMap(treeMap2, map2);
    }

    private static ArrayList<HashMap> sortMatchedTermsMap(TreeMap treeMap, HashMap map) {
        ArrayList<HashMap> arrayList = new ArrayList<>();
        for (String str : treeMap.keySet()) {
            HashMap map2 = new HashMap();
            map2.put("f", str);
            map2.put("t", map.get(str));
            arrayList.add(map2);
        }
        return arrayList;
    }

    protected static void buildTfidfIndex(ArrayList<Faq> arrayList) {
        int size = arrayList.size();
        PageIndexTrie pageIndexTrie = new PageIndexTrie(size);
        for (int i = 0; i < size; i++) {
            Faq faq = arrayList.get(i);
            buildPageIndexTrie(pageIndexTrie, faq.title, faq.body, faq.getTags(), i);
        }
        pageIndexTrie.createAndStoreTfIdfIndex();
    }

    protected static Map<String, List<FuzzySearchToken>> buildFuzzyIndex(ArrayList<Faq> arrayList) {
        HashMap map = new HashMap();
        Iterator<Faq> it = arrayList.iterator();
        int i = 0;
        while (it.hasNext()) {
            Iterator<String> it2 = generateTokens(sanitize(it.next().title)).iterator();
            while (it2.hasNext()) {
                String lowerCase = it2.next().toLowerCase();
                if (lowerCase.length() > 3) {
                    FuzzySearchToken fuzzySearchToken = new FuzzySearchToken(lowerCase, i + "");
                    String strSubstring = lowerCase.substring(0, 1);
                    List arrayList2 = (List) map.get(strSubstring);
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList();
                    }
                    arrayList2.add(fuzzySearchToken);
                    map.put(strSubstring, arrayList2);
                    String strSubstring2 = lowerCase.substring(1, 2);
                    List arrayList3 = (List) map.get(strSubstring2);
                    if (arrayList3 == null) {
                        arrayList3 = new ArrayList();
                    }
                    arrayList3.add(fuzzySearchToken);
                    map.put(strSubstring2, arrayList3);
                }
            }
            i++;
        }
        return map;
    }

    public static ArrayList<HashMap> getFuzzyMatches(String str, Map<String, List<FuzzySearchToken>> map) {
        ArrayList<HashMap> arrayList = new ArrayList<>();
        if (map != null) {
            HashMap map2 = new HashMap();
            Iterator<String> it = generateTokens(sanitize(str)).iterator();
            while (it.hasNext()) {
                String strSubstring = it.next().substring(0, 1);
                ArrayList arrayList2 = new ArrayList(getNeighbourCharacters(strSubstring));
                arrayList2.add(strSubstring);
                Iterator it2 = arrayList2.iterator();
                while (it2.hasNext()) {
                    ArrayList<FuzzySearchToken> arrayList3 = (ArrayList) map.get((String) it2.next());
                    if (arrayList3 != null) {
                        for (FuzzySearchToken fuzzySearchToken : arrayList3) {
                            String str2 = fuzzySearchToken.word;
                            if (calculateWordDistance(str2, r2) > 0.7d) {
                                String str3 = fuzzySearchToken.docId;
                                ArrayList arrayList4 = (ArrayList) map2.get(str3);
                                if (arrayList4 == null) {
                                    arrayList4 = new ArrayList();
                                }
                                arrayList4.add(str2);
                                map2.put(str3, arrayList4);
                            }
                        }
                    }
                }
            }
            for (Map.Entry entry : map2.entrySet()) {
                HashMap map3 = new HashMap();
                map3.put("f", entry.getKey());
                map3.put("t", entry.getValue());
                arrayList.add(map3);
            }
        }
        return arrayList;
    }

    private static List<String> getNeighbourCharacters(String str) {
        HashMap<String, String[]> characterTable2 = getCharacterTable();
        if (characterTable2 != null && characterTable2.containsKey(str)) {
            return Arrays.asList(characterTable2.get(str));
        }
        return new ArrayList();
    }

    static HashMap<String, String[]> getCharacterTable() {
        if (characterTable == null) {
            HashMap<String, String[]> map = new HashMap<>();
            characterTable = map;
            map.put("a", new String[]{"q", "w", "s", "z"});
            characterTable.put(PropertyValue.ValueTypes.BOOLEAN, new String[]{"v", "h", "n"});
            characterTable.put(ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, new String[]{"x", "f", "v"});
            characterTable.put("d", new String[]{"s", "z", "x"});
            characterTable.put("e", new String[]{"w", "s", "d", AnalyticsEventKey.SMART_INTENT_SEARCH_RANK});
            characterTable.put("f", new String[]{"d", ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, "x"});
            characterTable.put(ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, new String[]{"h", "f", "v", PropertyValue.ValueTypes.BOOLEAN});
            characterTable.put("h", new String[]{ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, "j", PropertyValue.ValueTypes.BOOLEAN, "n"});
            characterTable.put("i", new String[]{"u", "o", "k", "j"});
            characterTable.put("j", new String[]{ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY, "n", "h", "k"});
            characterTable.put("k", new String[]{"j", "l", ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY});
            characterTable.put("l", new String[]{"k", AnalyticsEventKey.PROTOCOL, ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY});
            characterTable.put(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY, new String[]{"n", PropertyValue.ValueTypes.BOOLEAN, "l"});
            characterTable.put("n", new String[]{PropertyValue.ValueTypes.BOOLEAN, "j", ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY});
            characterTable.put("o", new String[]{"l", "k", AnalyticsEventKey.PROTOCOL});
            characterTable.put(AnalyticsEventKey.PROTOCOL, new String[]{"l", "o"});
            characterTable.put("q", new String[]{"w", "a"});
            characterTable.put(AnalyticsEventKey.SMART_INTENT_SEARCH_RANK, new String[]{"s", "d", "e", "f"});
            characterTable.put("s", new String[]{"a", "z", "d"});
            characterTable.put("t", new String[]{AnalyticsEventKey.SMART_INTENT_SEARCH_RANK, "f", ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, "y"});
            characterTable.put("u", new String[]{"j", "h", "i", "y"});
            characterTable.put("v", new String[]{ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, PropertyValue.ValueTypes.BOOLEAN});
            characterTable.put("w", new String[]{"q", "a", "s"});
            characterTable.put("x", new String[]{"z", "s", ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR});
            characterTable.put("y", new String[]{ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, "h", "t", "u"});
            characterTable.put("z", new String[]{"a", "s", "x"});
        }
        return characterTable;
    }

    static float calculateWordDistance(String str, String str2) {
        String strTrim = str.trim();
        String strTrim2 = str2.trim();
        String lowerCase = strTrim.toLowerCase();
        String lowerCase2 = strTrim2.toLowerCase();
        int length = lowerCase.length();
        int length2 = lowerCase2.length();
        int i = length + 1;
        if (length == 0) {
            return 0.0f;
        }
        int i2 = length2 + 1;
        if (length2 == 0) {
            return 0.0f;
        }
        int i3 = i * i2;
        int[] iArr = new int[i3];
        for (int i4 = 0; i4 < i; i4++) {
            iArr[i4] = i4;
        }
        for (int i5 = 0; i5 < i2; i5++) {
            iArr[i5 * i] = i5;
        }
        for (int i6 = 1; i6 < i; i6++) {
            for (int i7 = 1; i7 < i2; i7++) {
                int i8 = i6 - 1;
                int i9 = i7 - 1;
                int i10 = lowerCase.charAt(i8) == lowerCase2.charAt(i9) ? 0 : 1;
                int i11 = (i7 * i) + i6;
                int i12 = (i9 * i) + i6;
                iArr[i11] = smallestOf(iArr[i12] + 1, iArr[i11 - 1] + 1, iArr[i12 - 1] + i10);
                if (i6 > 1 && i7 > 1) {
                    if (lowerCase.charAt(i8) == lowerCase2.charAt(i7 - 2) && lowerCase.charAt(i6 - 2) == lowerCase2.charAt(i9)) {
                        iArr[i11] = smallestOf(iArr[i11], iArr[((r10 * i) + i6) - 2] + i10);
                    }
                }
            }
        }
        int i13 = iArr[i3 - 1];
        if (i <= i2) {
            i = i2;
        }
        return 1.0f - (i13 / i);
    }
}

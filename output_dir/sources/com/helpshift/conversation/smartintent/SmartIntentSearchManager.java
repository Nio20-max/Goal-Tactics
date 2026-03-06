package com.helpshift.conversation.smartintent;

import com.helpshift.conversation.smartintent.dao.SmartIntentDAO;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SISearchResultDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.conversation.smartintent.dto.SmartIntentDTO;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentSearchManager {
    private static final int AI_LEAF_INTENT_MATCH_RESULT_LIMIT = 5;
    public static final int AI_MODEL_MATCH = 1;
    private static final int AI_ROOT_INTENT_MATCH_RESULT_LIMIT = 2;
    private static final int FALLBACK_INTENT_MATCH_RESULT_LIMIT = 5;
    private static final int MIN_CHAR_TO_TRIGGER_SEARCH = 4;
    public static final int SUBSTRING_MATCH = 2;
    private static final String TAG = "Helpshift_siSearchM";
    private Pattern patternGenerateToken = null;
    private SmartIntentDAO smartIntentDAO;

    public SmartIntentSearchManager(SmartIntentDAO smartIntentDAO) {
        this.smartIntentDAO = smartIntentDAO;
    }

    public SISearchResultDTO match(SITreeDTO sITreeDTO, String str) {
        if (StringUtils.isEmpty(str) || sITreeDTO == null) {
            return new SISearchResultDTO(false, null, null, null, null);
        }
        String strTrim = str.trim();
        if (strTrim.length() < 4) {
            return new SISearchResultDTO(false, null, null, null, null);
        }
        List<String> listGenerateTokensForSearchQuery = generateTokensForSearchQuery(sITreeDTO, strTrim);
        SISearchModelDTO modelWithoutWordProbabilities = this.smartIntentDAO.getModelWithoutWordProbabilities(sITreeDTO.localId.longValue());
        if (modelWithoutWordProbabilities != null) {
            return matchIntentsViaAIAlgorithm(sITreeDTO, modelWithoutWordProbabilities, listGenerateTokensForSearchQuery);
        }
        return matchIntentsViaSubstringAlgorithm(sITreeDTO, listGenerateTokensForSearchQuery);
    }

    private List<String> generateTokensForSearchQuery(SITreeDTO sITreeDTO, String str) {
        ArrayList arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            String strValueOf = String.valueOf(str.charAt(i));
            if (sITreeDTO.tokenDelimiter.contains(strValueOf)) {
                String string = sb.toString();
                if (StringUtils.isNotEmpty(string)) {
                    arrayList.add(string.trim().toLowerCase());
                    sb = new StringBuilder();
                }
            } else {
                sb.append(strValueOf);
            }
        }
        String string2 = sb.toString();
        if (StringUtils.isNotEmpty(string2)) {
            arrayList.add(string2.trim().toLowerCase());
        }
        return arrayList;
    }

    private SISearchResultDTO matchIntentsViaSubstringAlgorithm(SITreeDTO sITreeDTO, List<String> list) {
        HSLogger.d(TAG, "Triggering intent search via substring matching");
        ArrayList arrayList = new ArrayList();
        Iterator<SmartIntentDTO> it = sITreeDTO.rootIntents.iterator();
        while (it.hasNext()) {
            for (SmartIntentDTO smartIntentDTO : it.next().children) {
                String lowerCase = smartIntentDTO.label.toLowerCase();
                Iterator<String> it2 = list.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    if (lowerCase.contains(it2.next())) {
                        arrayList.add(new ValuePair(smartIntentDTO.serverId, null));
                        if (arrayList.size() == 5) {
                            return new SISearchResultDTO(true, 2, 2, null, arrayList);
                        }
                    }
                }
            }
        }
        return new SISearchResultDTO(true, 2, 2, null, arrayList);
    }

    private SISearchResultDTO matchIntentsViaAIAlgorithm(SITreeDTO sITreeDTO, SISearchModelDTO sISearchModelDTO, List<String> list) {
        HSLogger.d(TAG, "Triggering intent search via AI model");
        List<ValuePair<String, Double>> listRankProbabilities = rankProbabilities(getLeafIntentsProbability(sISearchModelDTO, list), sISearchModelDTO.leafIntentServerIds);
        if (ListUtils.isEmpty(listRankProbabilities)) {
            return new SISearchResultDTO(false, null, null, null, null);
        }
        if (listRankProbabilities.get(0).second.doubleValue() >= sISearchModelDTO.confidenceThreshold.doubleValue()) {
            return new SISearchResultDTO(true, 1, 2, sISearchModelDTO.version, getSubList(listRankProbabilities, 5, sISearchModelDTO.maxCombinedConfidence.doubleValue()));
        }
        HashMap map = new HashMap();
        for (ValuePair<String, Double> valuePair : listRankProbabilities) {
            map.put(valuePair.first, valuePair.second);
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (SmartIntentDTO smartIntentDTO : sITreeDTO.rootIntents) {
            Double dValueOf = Double.valueOf(0.0d);
            Iterator<SmartIntentDTO> it = smartIntentDTO.children.iterator();
            while (it.hasNext()) {
                Double d = (Double) map.get(it.next().serverId);
                if (d != null) {
                    dValueOf = Double.valueOf(dValueOf.doubleValue() + d.doubleValue());
                }
            }
            arrayList.add(smartIntentDTO.serverId);
            arrayList2.add(dValueOf);
        }
        return new SISearchResultDTO(true, 1, 1, sISearchModelDTO.version, getSubList(rankProbabilities(normalizeProbabilities(arrayList2), arrayList), 2, sISearchModelDTO.maxCombinedConfidence.doubleValue()));
    }

    private List<Double> getLeafIntentsProbability(SISearchModelDTO sISearchModelDTO, List<String> list) {
        List<Double> listJoinListsByElementsSum = sISearchModelDTO.leafIntentBaseProbabilities;
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            List<Double> wordToIntentProbabilities = this.smartIntentDAO.getWordToIntentProbabilities(sISearchModelDTO.localId.longValue(), it.next());
            if (ListUtils.isNotEmpty(wordToIntentProbabilities)) {
                listJoinListsByElementsSum = joinListsByElementsSum(listJoinListsByElementsSum, wordToIntentProbabilities);
            }
        }
        return normalizeProbabilities(listJoinListsByElementsSum);
    }

    private List<Double> normalizeProbabilities(List<Double> list) {
        Double d = (Double) Collections.max(list);
        ArrayList arrayList = new ArrayList();
        Iterator<Double> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(Double.valueOf(it.next().doubleValue() - d.doubleValue()));
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(Double.valueOf(Math.exp(((Double) it2.next()).doubleValue())));
        }
        Double dValueOf = Double.valueOf(0.0d);
        Iterator it3 = arrayList2.iterator();
        while (it3.hasNext()) {
            dValueOf = Double.valueOf(dValueOf.doubleValue() + ((Double) it3.next()).doubleValue());
        }
        if (dValueOf.doubleValue() == 0.0d) {
            return arrayList2;
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it4 = arrayList2.iterator();
        while (it4.hasNext()) {
            arrayList3.add(Double.valueOf(((Double) it4.next()).doubleValue() / dValueOf.doubleValue()));
        }
        return arrayList3;
    }

    private List<ValuePair<String, Double>> rankProbabilities(List<Double> list, List<String> list2) {
        if (list.size() != list2.size()) {
            return new ArrayList();
        }
        int size = list.size();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < size; i++) {
            arrayList.add(new ValuePair(list2.get(i), list.get(i)));
        }
        Collections.sort(arrayList, new Comparator<ValuePair<String, Double>>() { // from class: com.helpshift.conversation.smartintent.SmartIntentSearchManager.1
            @Override // java.util.Comparator
            public int compare(ValuePair<String, Double> valuePair, ValuePair<String, Double> valuePair2) {
                if (valuePair.second.equals(valuePair2.second)) {
                    return 0;
                }
                return valuePair.second.doubleValue() > valuePair2.second.doubleValue() ? -1 : 1;
            }
        });
        return arrayList;
    }

    private List<Double> joinListsByElementsSum(List<Double> list, List<Double> list2) {
        if (list == null || list2 == null || list.size() != list2.size()) {
            return null;
        }
        int size = list.size();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < size; i++) {
            arrayList.add(Double.valueOf(list.get(i).doubleValue() + list2.get(i).doubleValue()));
        }
        return arrayList;
    }

    private List<ValuePair<String, Double>> getSubList(List<ValuePair<String, Double>> list, int i, double d) {
        int iMin = Math.min(list.size(), i);
        ArrayList arrayList = new ArrayList();
        double dDoubleValue = 0.0d;
        for (int i2 = 0; i2 < iMin; i2++) {
            ValuePair<String, Double> valuePair = list.get(i2);
            arrayList.add(valuePair);
            dDoubleValue += valuePair.second.doubleValue();
            if (dDoubleValue >= d) {
                break;
            }
        }
        return arrayList;
    }
}

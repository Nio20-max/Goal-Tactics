package com.helpshift.conversation.smartintent.dto;

import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SISearchModelDTO {
    public final Double confidenceThreshold;
    public long lastRefreshedAt;
    public final List<Double> leafIntentBaseProbabilities;
    public final List<String> leafIntentServerIds;
    public Long localId;
    public final Double maxCombinedConfidence;
    public final Integer version;
    public final Map<String, List<Double>> wordToLeafIntentProbabilitiesMapping;

    public SISearchModelDTO(Integer num, Double d, Double d2, List<String> list, List<Double> list2, Map<String, List<Double>> map) {
        this.version = num;
        this.confidenceThreshold = d;
        this.maxCombinedConfidence = d2;
        this.leafIntentServerIds = list;
        this.leafIntentBaseProbabilities = list2;
        this.wordToLeafIntentProbabilitiesMapping = map;
    }
}

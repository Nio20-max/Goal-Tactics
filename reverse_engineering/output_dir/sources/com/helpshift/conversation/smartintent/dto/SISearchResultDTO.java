package com.helpshift.conversation.smartintent.dto;

import com.helpshift.util.ValuePair;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SISearchResultDTO {
    public final Integer aiModelVersion;
    public final boolean isSearchPerformed;
    public final Integer searchAlgorithmType;
    public final Integer searchIntentLevel;
    public final List<ValuePair<String, Double>> searchResults;

    public SISearchResultDTO(boolean z, Integer num, Integer num2, Integer num3, List<ValuePair<String, Double>> list) {
        this.isSearchPerformed = z;
        this.searchAlgorithmType = num;
        this.searchIntentLevel = num2;
        this.aiModelVersion = num3;
        this.searchResults = list;
    }
}

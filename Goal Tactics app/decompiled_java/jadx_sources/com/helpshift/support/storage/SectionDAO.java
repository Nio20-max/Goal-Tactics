package com.helpshift.support.storage;

import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.Section;
import java.util.List;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes2.dex */
public interface SectionDAO {
    void clearSectionsData();

    List<Section> getAllSections();

    List<Section> getAllSections(FaqTagFilter faqTagFilter);

    Section getSection(String str);

    void storeSections(JSONArray jSONArray);
}

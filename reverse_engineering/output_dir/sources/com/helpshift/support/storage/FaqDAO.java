package com.helpshift.support.storage;

import com.helpshift.support.Faq;
import com.helpshift.support.FaqTagFilter;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface FaqDAO {
    void addFaq(Faq faq);

    List<String> getAllFaqPublishIds();

    Faq getFaq(String str);

    Faq getFaq(String str, String str2);

    List<Faq> getFaqsDataForSection(String str);

    List<Faq> getFaqsForSection(String str, FaqTagFilter faqTagFilter);

    List<Faq> getFilteredFaqs(List<Faq> list, FaqTagFilter faqTagFilter);

    void removeFaq(String str);

    int setIsHelpful(String str, Boolean bool);
}

package com.helpshift.conversation.viewmodel;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes2.dex */
class ListPickerVM {
    private static final int MIN_CHAR_FOR_SEARCH = 2;
    private static final Object lock = new Object();
    private Domain domain;
    private final ListPickerVMCallback listPickerVMCallback;
    private final OptionInputMessageDM messageDM;

    interface OptionFilter {
        List<OptionInput.Option> filter(List<OptionInput.Option> list, List<String> list2);
    }

    ListPickerVM(Domain domain, OptionInputMessageDM optionInputMessageDM, ListPickerVMCallback listPickerVMCallback) {
        this.domain = domain;
        this.messageDM = optionInputMessageDM;
        this.listPickerVMCallback = listPickerVMCallback;
    }

    List<OptionUIModel> getAllOptions() {
        return convertToOptionUIModels(this.messageDM.input.options, null);
    }

    void onListPickerSearchQueryChange(String str) {
        if (StringUtils.isEmpty(str)) {
            notifyListPickerOptions(getAllOptions());
            notifyHideClearButton();
            return;
        }
        notifyShowClearButton();
        String strTrim = str.trim();
        if (strTrim.length() < 2) {
            notifyListPickerOptions(getAllOptions());
            return;
        }
        String[] strArrSplit = strTrim.split("\\b");
        final ArrayList arrayList = new ArrayList();
        for (String str2 : strArrSplit) {
            String lowerCase = str2.trim().toLowerCase();
            if (lowerCase.length() >= 2) {
                arrayList.add(lowerCase);
            }
        }
        if (arrayList.size() == 0) {
            notifyListPickerOptions(getAllOptions());
            return;
        }
        synchronized (lock) {
            this.domain.runParallel(new F() { // from class: com.helpshift.conversation.viewmodel.ListPickerVM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    List<OptionInput.Option> listFilter = ListPickerVM.this.new CompositeOptionFilter(new ArrayList(Arrays.asList(ListPickerVM.this.new SentencePrefixOptionFilter(), ListPickerVM.this.new WordPrefixOptionFilter(), ListPickerVM.this.new WordSubStringFilter()))).filter(ListPickerVM.this.messageDM.input.options, arrayList);
                    if (listFilter.size() == 0) {
                        ListPickerVM.this.notifyShowEmptyListPickerView();
                        return;
                    }
                    ArrayList arrayList2 = new ArrayList();
                    Iterator<OptionInput.Option> it = listFilter.iterator();
                    while (it.hasNext()) {
                        arrayList2.add(ListPickerVM.this.convertToOptionUIModel(it.next(), arrayList));
                    }
                    ListPickerVM.this.notifyListPickerOptions(arrayList2);
                }
            });
        }
    }

    private void notifyShowClearButton() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ListPickerVM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ListPickerVM.this.listPickerVMCallback != null) {
                    ListPickerVM.this.listPickerVMCallback.showPickerClearButton();
                }
            }
        });
    }

    private void notifyHideClearButton() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ListPickerVM.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ListPickerVM.this.listPickerVMCallback != null) {
                    ListPickerVM.this.listPickerVMCallback.hidePickerClearButton();
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyShowEmptyListPickerView() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ListPickerVM.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ListPickerVM.this.listPickerVMCallback != null) {
                    ListPickerVM.this.listPickerVMCallback.showEmptyListPickerView();
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyListPickerOptions(final List<OptionUIModel> list) {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ListPickerVM.5
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ListPickerVM.this.listPickerVMCallback != null) {
                    ListPickerVM.this.listPickerVMCallback.updateListPickerOptions(list);
                }
            }
        });
    }

    private List<OptionUIModel> convertToOptionUIModels(List<OptionInput.Option> list, List<String> list2) {
        ArrayList arrayList = new ArrayList();
        Iterator<OptionInput.Option> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(convertToOptionUIModel(it.next(), list2));
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public OptionUIModel convertToOptionUIModel(OptionInput.Option option, List<String> list) {
        return new OptionUIModel(option, !ListUtils.isEmpty(list) ? getHighlightInfo(option.title, list) : null);
    }

    void handleOptionSelectedForPicker(OptionUIModel optionUIModel, boolean z) {
        this.listPickerVMCallback.handleOptionSelectedForPicker(this.messageDM, z ? null : optionUIModel.option, z);
    }

    List<HSRange> getHighlightInfo(String str, List<String> list) {
        if (StringUtils.isEmpty(str) || ListUtils.isEmpty(list)) {
            return null;
        }
        String lowerCase = str.toLowerCase();
        ArrayList arrayList = new ArrayList();
        HashSet hashSet = new HashSet();
        for (String str2 : list) {
            if (!StringUtils.isEmpty(str2)) {
                Matcher matcher = Pattern.compile("\\b" + str2.toLowerCase()).matcher(lowerCase);
                while (matcher.find()) {
                    int iStart = matcher.start();
                    if (!hashSet.contains(Integer.valueOf(iStart))) {
                        arrayList.add(new HSRange(iStart, matcher.end() - iStart));
                        hashSet.add(Integer.valueOf(iStart));
                    }
                }
            }
        }
        if (ListUtils.isEmpty(arrayList)) {
            return null;
        }
        return arrayList;
    }

    class CompositeOptionFilter implements OptionFilter {
        private List<OptionFilter> optionFilters;

        CompositeOptionFilter(List<OptionFilter> list) {
            this.optionFilters = list;
        }

        @Override // com.helpshift.conversation.viewmodel.ListPickerVM.OptionFilter
        public List<OptionInput.Option> filter(List<OptionInput.Option> list, List<String> list2) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            Iterator<OptionFilter> it = this.optionFilters.iterator();
            while (it.hasNext()) {
                linkedHashSet.addAll(it.next().filter(list, list2));
            }
            return new ArrayList(linkedHashSet);
        }
    }

    private abstract class BaseOptionFilter implements OptionFilter {
        abstract String getRegex(String str);

        private BaseOptionFilter() {
        }

        @Override // com.helpshift.conversation.viewmodel.ListPickerVM.OptionFilter
        public final List<OptionInput.Option> filter(List<OptionInput.Option> list, List<String> list2) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            Iterator<String> it = list2.iterator();
            while (it.hasNext()) {
                linkedHashSet.addAll(filterResult(list, getRegex(it.next())));
            }
            return new ArrayList(linkedHashSet);
        }

        private List<OptionInput.Option> filterResult(List<OptionInput.Option> list, String str) {
            ArrayList arrayList = new ArrayList();
            Pattern patternCompile = Pattern.compile(str);
            for (OptionInput.Option option : list) {
                if (patternCompile.matcher(option.title.toLowerCase()).find()) {
                    arrayList.add(option);
                }
            }
            return arrayList;
        }
    }

    class SentencePrefixOptionFilter extends BaseOptionFilter {
        SentencePrefixOptionFilter() {
            super();
        }

        @Override // com.helpshift.conversation.viewmodel.ListPickerVM.BaseOptionFilter
        String getRegex(String str) {
            return "^" + str;
        }
    }

    class WordPrefixOptionFilter extends BaseOptionFilter {
        WordPrefixOptionFilter() {
            super();
        }

        @Override // com.helpshift.conversation.viewmodel.ListPickerVM.BaseOptionFilter
        String getRegex(String str) {
            return "\\b" + str;
        }
    }

    class WordSubStringFilter extends BaseOptionFilter {
        WordSubStringFilter() {
            super();
        }

        @Override // com.helpshift.conversation.viewmodel.ListPickerVM.BaseOptionFilter
        String getRegex(String str) {
            return "\\B" + str;
        }
    }
}

package com.helpshift.conversation.viewmodel;

import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class OptionUIModel {
    public final OptionInput.Option option;
    public final List<HSRange> titleHighlightInfo;

    public OptionUIModel(OptionInput.Option option, List<HSRange> list) {
        this.option = option;
        this.titleHighlightInfo = list;
    }
}

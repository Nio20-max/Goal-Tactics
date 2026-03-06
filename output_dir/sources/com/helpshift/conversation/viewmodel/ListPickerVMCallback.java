package com.helpshift.conversation.viewmodel;

import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public interface ListPickerVMCallback {
    void handleOptionSelectedForPicker(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z);

    void hidePickerClearButton();

    void showEmptyListPickerView();

    void showPickerClearButton();

    void updateListPickerOptions(List<OptionUIModel> list);
}

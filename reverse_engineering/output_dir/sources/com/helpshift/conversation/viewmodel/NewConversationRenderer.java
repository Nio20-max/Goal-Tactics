package com.helpshift.conversation.viewmodel;

import com.helpshift.common.exception.ExceptionType;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.widget.TextViewState;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public interface NewConversationRenderer {
    void clearDescriptionError();

    void clearEmailError();

    void clearNameError();

    void disableImageAttachmentClickable();

    void enableImageAttachmentClickable();

    void exit();

    void gotoConversation(long j);

    void hideImageAttachmentButton();

    void hideImageAttachmentContainer();

    void hideProfileForm();

    void hideProgressBar();

    void hideStartConversationButton();

    void onAuthenticationFailure();

    void setDescription(String str);

    void setEmail(String str);

    void setEmailRequired();

    void setName(String str);

    void showAttachmentPreviewScreenFromDraft(AttachmentPickerFile attachmentPickerFile);

    void showConversationStartedMessage();

    void showDescriptionEmptyError();

    void showDescriptionLessThanMinimumError();

    void showDescriptionOnlySpecialCharactersError();

    void showEmailEmptyError();

    void showEmailInvalidError();

    void showErrorView(ExceptionType exceptionType);

    void showImageAttachmentButton();

    void showImageAttachmentContainer(String str, String str2, Long l);

    void showNameEmptyError();

    void showNameOnlySpecialCharactersError();

    void showProfileForm();

    void showProgressBar();

    void showSearchResultFragment(ArrayList arrayList);

    void showStartConversationButton();

    void updateDescriptionErrorState(TextViewState.TextViewStatesError textViewStatesError);

    void updateEmailErrorState(TextViewState.TextViewStatesError textViewStatesError, boolean z);

    void updateImageAttachmentButton(boolean z);

    void updateImageAttachmentClick(boolean z);

    void updateImageAttachmentPickerFile(AttachmentPickerFile attachmentPickerFile);

    void updateNameErrorState(TextViewState.TextViewStatesError textViewStatesError);

    void updateProfileForm(boolean z);

    void updateProgressBarVisibility(boolean z);

    void updateStartConversationButton(boolean z);
}

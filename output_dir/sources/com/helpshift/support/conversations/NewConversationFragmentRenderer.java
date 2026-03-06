package com.helpshift.support.conversations;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.cardview.widget.CardView;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;
import com.helpshift.R;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.viewmodel.NewConversationRenderer;
import com.helpshift.support.fragments.HSMenuItemType;
import com.helpshift.support.fragments.IToolbarMenuItemRenderer;
import com.helpshift.support.imageloader.ImageLoader;
import com.helpshift.support.imageloader.ImageLoaderCallback;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.util.AttachmentFileSize;
import com.helpshift.util.StringUtils;
import com.helpshift.views.HSToast;
import com.helpshift.widget.TextViewState;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class NewConversationFragmentRenderer implements NewConversationRenderer {
    private final ImageButton attachmentClearButton;
    private final CardView attachmentContainer;
    private final TextView attachmentFileName;
    private final TextView attachmentFileSize;
    private final ImageView attachmentImage;
    private final Context context;
    private final TextInputEditText descriptionField;
    private final TextInputLayout descriptionFieldWrapper;
    private final TextInputEditText emailField;
    private final TextInputLayout emailFieldWrapper;
    private final IToolbarMenuItemRenderer menuItemRenderer;
    private final TextInputEditText nameField;
    private final TextInputLayout nameFieldWrapper;
    private final NewConversationRouter newConversationRouter;
    private final View parentView;
    private final ProgressBar progressBar;

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void disableImageAttachmentClickable() {
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void enableImageAttachmentClickable() {
    }

    NewConversationFragmentRenderer(Context context, TextInputLayout textInputLayout, TextInputEditText textInputEditText, TextInputLayout textInputLayout2, TextInputEditText textInputEditText2, TextInputLayout textInputLayout3, TextInputEditText textInputEditText3, ProgressBar progressBar, ImageView imageView, TextView textView, TextView textView2, CardView cardView, ImageButton imageButton, View view, NewConversationRouter newConversationRouter, IToolbarMenuItemRenderer iToolbarMenuItemRenderer) {
        this.context = context;
        this.descriptionFieldWrapper = textInputLayout;
        this.descriptionField = textInputEditText;
        this.nameFieldWrapper = textInputLayout2;
        this.nameField = textInputEditText2;
        this.emailFieldWrapper = textInputLayout3;
        this.emailField = textInputEditText3;
        this.progressBar = progressBar;
        this.attachmentImage = imageView;
        this.attachmentFileName = textView;
        this.attachmentFileSize = textView2;
        this.attachmentContainer = cardView;
        this.attachmentClearButton = imageButton;
        this.parentView = view;
        this.newConversationRouter = newConversationRouter;
        this.menuItemRenderer = iToolbarMenuItemRenderer;
    }

    private String getText(int i) {
        return this.context.getText(i).toString();
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showDescriptionEmptyError() {
        setError(this.descriptionFieldWrapper, getText(R.string.hs__conversation_detail_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showDescriptionLessThanMinimumError() {
        setError(this.descriptionFieldWrapper, getText(R.string.hs__description_invalid_length_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showDescriptionOnlySpecialCharactersError() {
        setError(this.descriptionFieldWrapper, getText(R.string.hs__invalid_description_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void clearDescriptionError() {
        setError(this.descriptionFieldWrapper, null);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showNameEmptyError() {
        setError(this.nameFieldWrapper, getText(R.string.hs__username_blank_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showNameOnlySpecialCharactersError() {
        setError(this.nameFieldWrapper, getText(R.string.hs__username_blank_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void clearNameError() {
        setError(this.nameFieldWrapper, null);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showEmailInvalidError() {
        setError(this.emailFieldWrapper, getText(R.string.hs__invalid_email_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showEmailEmptyError() {
        setError(this.emailFieldWrapper, getText(R.string.hs__invalid_email_error));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void clearEmailError() {
        setError(this.emailFieldWrapper, null);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void hideImageAttachmentButton() {
        changeMenuItemVisibility(HSMenuItemType.SCREENSHOT_ATTACHMENT, false);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showImageAttachmentButton() {
        changeMenuItemVisibility(HSMenuItemType.SCREENSHOT_ATTACHMENT, true);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateImageAttachmentButton(boolean z) {
        changeMenuItemVisibility(HSMenuItemType.SCREENSHOT_ATTACHMENT, z);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showImageAttachmentContainer(String str, final String str2, final Long l) {
        ImageLoader.getInstance().load(str, this.attachmentImage, this.context.getResources().getDrawable(R.drawable.hs__placeholder_image), new ImageLoaderCallback() { // from class: com.helpshift.support.conversations.NewConversationFragmentRenderer.1
            @Override // com.helpshift.support.imageloader.ImageLoaderCallback
            public void onSuccess() {
                TextView textView = NewConversationFragmentRenderer.this.attachmentFileName;
                String str3 = str2;
                if (str3 == null) {
                    str3 = "";
                }
                textView.setText(str3);
                NewConversationFragmentRenderer.this.attachmentFileSize.setText(l != null ? AttachmentFileSize.getFormattedFileSize(r0.longValue()) : "");
                NewConversationFragmentRenderer.this.attachmentImage.setVisibility(0);
                NewConversationFragmentRenderer.this.attachmentClearButton.setVisibility(0);
                NewConversationFragmentRenderer.this.attachmentContainer.setVisibility(0);
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void hideImageAttachmentContainer() {
        this.attachmentContainer.setVisibility(8);
        this.attachmentImage.setVisibility(8);
        this.attachmentClearButton.setVisibility(8);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateImageAttachmentPickerFile(AttachmentPickerFile attachmentPickerFile) {
        if (attachmentPickerFile == null || StringUtils.isEmpty(attachmentPickerFile.filePath)) {
            hideImageAttachmentContainer();
        } else {
            showImageAttachmentContainer(attachmentPickerFile.filePath, attachmentPickerFile.originalFileName, attachmentPickerFile.originalFileSize);
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateImageAttachmentClick(boolean z) {
        if (z) {
            enableImageAttachmentClickable();
        } else {
            disableImageAttachmentClickable();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void setDescription(String str) {
        this.descriptionField.setText(str);
        TextInputEditText textInputEditText = this.descriptionField;
        textInputEditText.setSelection(textInputEditText.getText().length());
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void setName(String str) {
        this.nameField.setText(str);
        TextInputEditText textInputEditText = this.nameField;
        textInputEditText.setSelection(textInputEditText.getText().length());
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void setEmail(String str) {
        this.emailField.setText(str);
        TextInputEditText textInputEditText = this.emailField;
        textInputEditText.setSelection(textInputEditText.getText().length());
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showProfileForm() {
        this.nameField.setVisibility(0);
        this.emailField.setVisibility(0);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void hideProfileForm() {
        this.nameField.setVisibility(8);
        this.emailField.setVisibility(8);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void setEmailRequired() {
        this.emailField.setHint(getText(R.string.hs__email_required_hint));
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateProfileForm(boolean z) {
        if (z) {
            showProfileForm();
        } else {
            hideProfileForm();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateStartConversationButton(boolean z) {
        changeMenuItemVisibility(HSMenuItemType.START_NEW_CONVERSATION, z);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateDescriptionErrorState(TextViewState.TextViewStatesError textViewStatesError) {
        if (TextViewState.TextViewStatesError.EMPTY.equals(textViewStatesError)) {
            showDescriptionEmptyError();
            return;
        }
        if (TextViewState.TextViewStatesError.ONLY_SPECIAL_CHARACTERS.equals(textViewStatesError)) {
            showDescriptionOnlySpecialCharactersError();
        } else if (TextViewState.TextViewStatesError.LESS_THAN_MINIMUM_LENGTH.equals(textViewStatesError)) {
            showDescriptionLessThanMinimumError();
        } else {
            clearDescriptionError();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateNameErrorState(TextViewState.TextViewStatesError textViewStatesError) {
        if (TextViewState.TextViewStatesError.EMPTY.equals(textViewStatesError)) {
            showNameEmptyError();
        } else if (TextViewState.TextViewStatesError.ONLY_SPECIAL_CHARACTERS.equals(textViewStatesError)) {
            showNameOnlySpecialCharactersError();
        } else {
            clearNameError();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateEmailErrorState(TextViewState.TextViewStatesError textViewStatesError, boolean z) {
        if (TextViewState.TextViewStatesError.INVALID_EMAIL.equals(textViewStatesError)) {
            showEmailInvalidError();
        } else if (TextViewState.TextViewStatesError.EMPTY.equals(textViewStatesError)) {
            showEmailEmptyError();
        } else {
            clearEmailError();
        }
        if (z) {
            setEmailRequired();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showStartConversationButton() {
        changeMenuItemVisibility(HSMenuItemType.START_NEW_CONVERSATION, true);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void hideStartConversationButton() {
        changeMenuItemVisibility(HSMenuItemType.START_NEW_CONVERSATION, false);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void gotoConversation(long j) {
        this.newConversationRouter.showConversationScreen();
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void exit() {
        this.newConversationRouter.exitNewConversationView();
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showAttachmentPreviewScreenFromDraft(AttachmentPickerFile attachmentPickerFile) {
        this.newConversationRouter.showAttachmentPreviewScreenFromDraft(attachmentPickerFile);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showProgressBar() {
        this.progressBar.setVisibility(0);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void updateProgressBarVisibility(boolean z) {
        if (z) {
            showProgressBar();
        } else {
            hideProgressBar();
        }
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void hideProgressBar() {
        this.progressBar.setVisibility(8);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showConversationStartedMessage() {
        HSToast.makeText(this.context, R.string.hs__conversation_started_message, 0).show();
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showSearchResultFragment(ArrayList arrayList) {
        this.newConversationRouter.showSearchResultFragment(arrayList);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void showErrorView(ExceptionType exceptionType) {
        SnackbarUtil.showSnackbar(exceptionType, this.parentView);
    }

    @Override // com.helpshift.conversation.viewmodel.NewConversationRenderer
    public void onAuthenticationFailure() {
        this.newConversationRouter.onAuthenticationFailure();
    }

    private void setError(TextInputLayout textInputLayout, CharSequence charSequence) {
        textInputLayout.setErrorEnabled(!TextUtils.isEmpty(charSequence));
        textInputLayout.setError(charSequence);
    }

    private void changeMenuItemVisibility(HSMenuItemType hSMenuItemType, boolean z) {
        IToolbarMenuItemRenderer iToolbarMenuItemRenderer = this.menuItemRenderer;
        if (iToolbarMenuItemRenderer != null) {
            iToolbarMenuItemRenderer.updateMenuItemVisibility(hSMenuItemType, z);
        }
    }
}

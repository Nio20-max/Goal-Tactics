package com.helpshift.support.conversations;

import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.cardview.widget.CardView;
import com.google.android.material.textfield.TextInputEditText;
import com.google.android.material.textfield.TextInputLayout;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.Domain;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.viewmodel.NewConversationVM;
import com.helpshift.support.Faq;
import com.helpshift.support.fragments.AttachmentPreviewFragment;
import com.helpshift.support.fragments.HSMenuItemType;
import com.helpshift.support.fragments.IMenuItemEventListener;
import com.helpshift.support.fragments.SearchResultFragment;
import com.helpshift.support.util.AppSessionConstants;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.KeyboardUtil;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.HSObserver;
import com.helpshift.widget.ImageAttachmentViewState;
import com.helpshift.widget.TextViewState;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class NewConversationFragment extends BaseConversationFragment implements NewConversationRouter, MenuItem.OnMenuItemClickListener, IMenuItemEventListener {
    public static final String FRAGMENT_TAG = "HSNewConversationFragment";
    public static final String SEARCH_PERFORMED = "search_performed";
    public static final String SHOULD_DROP_META = "dropMeta";
    public static final String SOURCE_SEARCH_QUERY = "source_search_query";
    private TextInputEditText descriptionField;
    NewConversationVM newConversationVM;
    private NewConversationFragmentRenderer renderer;
    private AttachmentPickerFile selectedImageFile;
    private boolean shouldUpdateAttachment;

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected int getAttachmentMode() {
        return 1;
    }

    public static NewConversationFragment newInstance(Bundle bundle) {
        NewConversationFragment newConversationFragment = new NewConversationFragment();
        newConversationFragment.setArguments(bundle);
        return newConversationFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__new_conversation_fragment, viewGroup, false);
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        if (isChangingConfigurations()) {
            return;
        }
        HelpshiftContext.getCoreApi().getConversationController().deleteCachedFilesForResolvedConversations();
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        addViewStateObservers();
        if (!isChangingConfigurations()) {
            HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.REPORTED_ISSUE);
        }
        this.descriptionField.requestFocus();
        KeyboardUtil.showKeyboard(getContext(), this.descriptionField);
        this.newConversationVM.setConversationViewState(1);
    }

    private void addViewStateObservers() {
        Domain domain = HelpshiftContext.getCoreApi().getDomain();
        this.newConversationVM.getDescriptionViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.1
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                TextViewState textViewState = (TextViewState) obj;
                NewConversationFragment.this.renderer.setDescription(textViewState.getText());
                NewConversationFragment.this.renderer.updateDescriptionErrorState(textViewState.getError());
            }
        });
        this.newConversationVM.getProgressBarViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.2
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                NewConversationFragment.this.renderer.updateProgressBarVisibility(((BaseViewState) obj).isVisible());
            }
        });
        this.newConversationVM.getStartConversationButtonState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.3
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                NewConversationFragment.this.renderer.updateStartConversationButton(((BaseViewState) obj).isVisible());
            }
        });
        this.newConversationVM.getAttachImageButtonViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.4
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                NewConversationFragment.this.renderer.updateImageAttachmentButton(((BaseViewState) obj).isVisible());
            }
        });
        this.newConversationVM.getImageAttachmentViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.5
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ImageAttachmentViewState imageAttachmentViewState = (ImageAttachmentViewState) obj;
                NewConversationFragment.this.renderer.updateImageAttachmentPickerFile(imageAttachmentViewState.getAttachmentPickerFile());
                NewConversationFragment.this.renderer.updateImageAttachmentClick(imageAttachmentViewState.isClickable());
            }
        });
        this.newConversationVM.getNameViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.6
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                TextViewState textViewState = (TextViewState) obj;
                NewConversationFragment.this.renderer.setName(textViewState.getText());
                NewConversationFragment.this.renderer.updateNameErrorState(textViewState.getError());
            }
        });
        this.newConversationVM.getEmailViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.7
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                TextViewState textViewState = (TextViewState) obj;
                NewConversationFragment.this.renderer.setEmail(textViewState.getText());
                NewConversationFragment.this.renderer.updateEmailErrorState(textViewState.getError(), textViewState.isRequired());
            }
        });
        this.newConversationVM.getProfileFormViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.NewConversationFragment.8
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                NewConversationFragment.this.renderer.updateProfileForm(((BaseViewState) obj).isVisible());
            }
        });
    }

    private void removeViewStateObservers() {
        this.newConversationVM.getDescriptionViewState().unsubscribe();
        this.newConversationVM.getProgressBarViewState().unsubscribe();
        this.newConversationVM.getStartConversationButtonState().unsubscribe();
        this.newConversationVM.getAttachImageButtonViewState().unsubscribe();
        this.newConversationVM.getImageAttachmentViewState().unsubscribe();
        this.newConversationVM.getNameViewState().unsubscribe();
        this.newConversationVM.getEmailViewState().unsubscribe();
        this.newConversationVM.getProfileFormViewState().unsubscribe();
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected AppSessionConstants.Screen getViewName() {
        return AppSessionConstants.Screen.NEW_CONVERSATION;
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected String getToolbarTitle() {
        return getString(R.string.hs__new_conversation_header);
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected void onPermissionGranted(int i) {
        if (i != 2) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, getAttachmentMode());
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, 1);
        getSupportFragment().launchAttachmentPicker(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        initialize(view);
        super.onViewCreated(view, bundle);
        getSupportFragment().registerToolbarMenuEventsListener(this);
        setViewListeners(view);
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, androidx.fragment.app.Fragment
    public void onDestroyView() {
        getSupportFragment().unRegisterToolbarMenuEventsListener(this);
        this.newConversationVM.unregisterRenderer(this.renderer);
        this.newConversationVM.setConversationViewState(-1);
        super.onDestroyView();
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onPause() {
        removeViewStateObservers();
        super.onPause();
        KeyboardUtil.hideKeyboard(getContext(), this.descriptionField);
    }

    private void initialize(View view) {
        boolean z;
        TextInputLayout textInputLayout = (TextInputLayout) view.findViewById(R.id.hs__conversationDetailWrapper);
        textInputLayout.setHintEnabled(false);
        textInputLayout.setHintAnimationEnabled(false);
        this.descriptionField = (TextInputEditText) view.findViewById(R.id.hs__conversationDetail);
        TextInputLayout textInputLayout2 = (TextInputLayout) view.findViewById(R.id.hs__usernameWrapper);
        textInputLayout2.setHintEnabled(false);
        textInputLayout2.setHintAnimationEnabled(false);
        TextInputEditText textInputEditText = (TextInputEditText) view.findViewById(R.id.hs__username);
        TextInputLayout textInputLayout3 = (TextInputLayout) view.findViewById(R.id.hs__emailWrapper);
        textInputLayout3.setHintEnabled(false);
        textInputLayout3.setHintAnimationEnabled(false);
        TextInputEditText textInputEditText2 = (TextInputEditText) view.findViewById(R.id.hs__email);
        addTopMarginToView(textInputEditText);
        addTopMarginToView(textInputEditText2);
        this.renderer = new NewConversationFragmentRenderer(getContext(), textInputLayout, this.descriptionField, textInputLayout2, textInputEditText, textInputLayout3, textInputEditText2, (ProgressBar) view.findViewById(R.id.progress_bar), (ImageView) view.findViewById(R.id.hs__screenshot), (TextView) view.findViewById(R.id.attachment_file_name), (TextView) view.findViewById(R.id.attachment_file_size), (CardView) view.findViewById(R.id.screenshot_view_container), (ImageButton) view.findViewById(android.R.id.button2), getView(), this, getSupportFragment());
        NewConversationVM newConversationViewModel = HelpshiftContext.getCoreApi().getNewConversationViewModel(this.renderer);
        this.newConversationVM = newConversationViewModel;
        if (this.shouldUpdateAttachment) {
            newConversationViewModel.setImageAttachment(this.selectedImageFile);
            z = false;
            this.shouldUpdateAttachment = false;
        } else {
            z = false;
        }
        this.descriptionField.addTextChangedListener(new TextWatcherAdapter() { // from class: com.helpshift.support.conversations.NewConversationFragment.9
            @Override // com.helpshift.support.conversations.TextWatcherAdapter, android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                NewConversationFragment.this.newConversationVM.setDescription(charSequence.toString());
            }
        });
        textInputEditText.addTextChangedListener(new TextWatcherAdapter() { // from class: com.helpshift.support.conversations.NewConversationFragment.10
            @Override // com.helpshift.support.conversations.TextWatcherAdapter, android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                NewConversationFragment.this.newConversationVM.setName(charSequence.toString());
            }
        });
        textInputEditText2.addTextChangedListener(new TextWatcherAdapter() { // from class: com.helpshift.support.conversations.NewConversationFragment.11
            @Override // com.helpshift.support.conversations.TextWatcherAdapter, android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                NewConversationFragment.this.newConversationVM.setEmail(charSequence.toString());
            }
        });
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.newConversationVM.setSearchQuery(arguments.getString(SOURCE_SEARCH_QUERY));
            this.newConversationVM.setShouldDropCustomMetadata(arguments.getBoolean(SHOULD_DROP_META));
            this.newConversationVM.setWasSearchPerformed(getArguments().getBoolean(SEARCH_PERFORMED, z));
        }
    }

    private void addTopMarginToView(View view) {
        if (Build.VERSION.SDK_INT >= 30) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
            marginLayoutParams.setMargins(marginLayoutParams.leftMargin, (int) getResources().getDimension(R.dimen.hs__formBasedFieldsMarginTop), marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
        }
    }

    private void setViewListeners(View view) {
        TextInputEditText textInputEditText = (TextInputEditText) view.findViewById(R.id.hs__conversationDetail);
        this.descriptionField = textInputEditText;
        textInputEditText.setOnTouchListener(new View.OnTouchListener() { // from class: com.helpshift.support.conversations.NewConversationFragment.12
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view2, MotionEvent motionEvent) {
                if (view2.getId() == R.id.hs__conversationDetail) {
                    view2.getParent().requestDisallowInterceptTouchEvent(true);
                    if ((motionEvent.getAction() & 255) == 1) {
                        view2.getParent().requestDisallowInterceptTouchEvent(false);
                    }
                }
                return false;
            }
        });
        ImageButton imageButton = (ImageButton) view.findViewById(android.R.id.button2);
        imageButton.setVisibility(8);
        ImageView imageView = (ImageView) view.findViewById(R.id.hs__screenshot);
        imageButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.NewConversationFragment.13
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                NewConversationFragment.this.newConversationVM.handleImageAttachmentClearButtonClick();
            }
        });
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.NewConversationFragment.14
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                NewConversationFragment.this.newConversationVM.handleImageAttachmentClick();
            }
        });
    }

    public boolean handleScreenshotAction(AttachmentPreviewFragment.AttachmentAction attachmentAction, AttachmentPickerFile attachmentPickerFile) {
        int i = AnonymousClass15.$SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction[attachmentAction.ordinal()];
        if (i == 1) {
            NewConversationVM newConversationVM = this.newConversationVM;
            if (newConversationVM == null) {
                this.selectedImageFile = attachmentPickerFile;
                this.shouldUpdateAttachment = true;
            } else {
                newConversationVM.setImageAttachment(attachmentPickerFile);
            }
            return true;
        }
        if (i != 2) {
            return false;
        }
        NewConversationVM newConversationVM2 = this.newConversationVM;
        if (newConversationVM2 == null) {
            this.selectedImageFile = null;
            this.shouldUpdateAttachment = true;
        } else {
            newConversationVM2.setImageAttachment(null);
        }
        return true;
    }

    public void startNewConversation() {
        this.newConversationVM.startNewConversation();
    }

    @Override // com.helpshift.support.conversations.NewConversationRouter
    public void showSearchResultFragment(ArrayList<Faq> arrayList) {
        Bundle bundle = new Bundle();
        bundle.putParcelableArrayList(SearchResultFragment.BUNDLE_ARG_SEARCH_RESULTS, arrayList);
        getSupportController().showConversationSearchResultFragment(bundle);
    }

    @Override // com.helpshift.support.conversations.NewConversationRouter
    public void exitNewConversationView() {
        getSupportFragment().exitSdkSession();
    }

    @Override // com.helpshift.support.conversations.NewConversationRouter
    public void showConversationScreen() {
        if (isResumed()) {
            getSupportController().startConversationFlow();
        }
    }

    @Override // com.helpshift.support.conversations.NewConversationRouter
    public void showAttachmentPreviewScreenFromDraft(AttachmentPickerFile attachmentPickerFile) {
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, 2);
        bundle.putString(AttachmentPreviewFragment.KEY_MESSAGE_REFERS_ID, null);
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, 1);
        attachmentPickerFile.attachmentType = 1;
        getSupportController().startScreenshotPreviewFragment(attachmentPickerFile, bundle, AttachmentPreviewFragment.LaunchSource.ATTACHMENT_DRAFT);
    }

    @Override // com.helpshift.support.conversations.NewConversationRouter
    public void onAuthenticationFailure() {
        getSupportController().onAuthenticationFailure();
    }

    @Override // com.helpshift.support.fragments.IMenuItemEventListener
    public void onCreateOptionMenuCalled() {
        this.renderer.updateStartConversationButton(this.newConversationVM.getStartConversationButtonState().isVisible());
        this.renderer.updateImageAttachmentButton(this.newConversationVM.getAttachImageButtonViewState().isVisible());
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.NewConversationFragment$15, reason: invalid class name */
    static /* synthetic */ class AnonymousClass15 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction;
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$support$fragments$HSMenuItemType;

        static {
            int[] iArr = new int[HSMenuItemType.values().length];
            $SwitchMap$com$helpshift$support$fragments$HSMenuItemType = iArr;
            try {
                iArr[HSMenuItemType.START_NEW_CONVERSATION.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$support$fragments$HSMenuItemType[HSMenuItemType.SCREENSHOT_ATTACHMENT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            int[] iArr2 = new int[AttachmentPreviewFragment.AttachmentAction.values().length];
            $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction = iArr2;
            try {
                iArr2[AttachmentPreviewFragment.AttachmentAction.ADD.ordinal()] = 1;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction[AttachmentPreviewFragment.AttachmentAction.REMOVE.ordinal()] = 2;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    @Override // com.helpshift.support.fragments.IMenuItemEventListener
    public void onMenuItemClicked(HSMenuItemType hSMenuItemType) {
        int i = AnonymousClass15.$SwitchMap$com$helpshift$support$fragments$HSMenuItemType[hSMenuItemType.ordinal()];
        if (i == 1) {
            this.newConversationVM.showSearchOrStartNewConversation();
            return;
        }
        if (i != 2) {
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, getAttachmentMode());
        bundle.putString(AttachmentPreviewFragment.KEY_MESSAGE_REFERS_ID, null);
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, 1);
        getSupportFragment().launchAttachmentPicker(bundle);
    }
}

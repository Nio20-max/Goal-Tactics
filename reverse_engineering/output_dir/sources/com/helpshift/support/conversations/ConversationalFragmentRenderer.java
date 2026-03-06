package com.helpshift.support.conversations;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.SimpleItemAnimator;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.helpshift.R;
import com.helpshift.android.commons.downloader.HsUriUtils;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.common.exception.PlatformException;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.activeconversation.ConversationalRenderer;
import com.helpshift.conversation.activeconversation.SmartIntentRenderer;
import com.helpshift.conversation.activeconversation.message.ConversationFooterState;
import com.helpshift.conversation.activeconversation.message.HistoryLoadingState;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.input.Input;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.activeconversation.message.input.TextInput;
import com.helpshift.conversation.smartintent.BaseSmartIntentViewState;
import com.helpshift.conversation.smartintent.SmartIntentCollapsedRootViewState;
import com.helpshift.conversation.viewmodel.OptionUIModel;
import com.helpshift.delegate.RootDelegate;
import com.helpshift.support.Support;
import com.helpshift.support.conversations.picker.PickerAdapter;
import com.helpshift.support.fragments.HSMenuItemType;
import com.helpshift.support.fragments.IToolbarMenuItemRenderer;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.support.util.Styles;
import com.helpshift.support.widget.AttachmentTypeOptionPicker;
import com.helpshift.util.FileUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.IntentUtil;
import com.helpshift.util.KeyboardUtil;
import com.helpshift.util.StringUtils;
import com.helpshift.views.bottomsheet.HSBottomSheet;
import java.io.File;
import java.text.ParseException;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationalFragmentRenderer implements ConversationalRenderer {
    private static final int OPTIONS_PICKER_PEEK_HEIGHT = 142;
    ImageButton addAttachmentButton;
    AttachmentTypeOptionPicker attachmentPicker;
    BottomSheetBehavior bottomSheetBehavior;
    View confirmationBoxView;
    Context context;
    ConversationalFragmentRouter conversationalFragmentRouter;
    boolean isAvatarEnabledInChatFeed;
    boolean isHSBrandingDisabled;
    RecyclerView.ItemDecoration lastMessageItemDecor;
    Window listPickerHostWindow;
    IToolbarMenuItemRenderer menuItemRenderer;
    MessagesAdapter messagesAdapter;
    RecyclerView messagesRecyclerView;
    LinearLayout networkErrorFooter;
    View parentView;
    PickerAdapter pickerAdapter;
    ImageView pickerBackView;
    HSBottomSheet pickerBottomSheet;
    ImageView pickerClearView;
    ImageView pickerCollapseView;
    View pickerCollapsedHeader;
    TextView pickerCollapsedHeaderText;
    View pickerCollapsedShadow;
    View pickerEmptySearchResultsView;
    ImageView pickerExpandView;
    View pickerExpandedHeader;
    TextView pickerExpandedHeaderText;
    View pickerExpandedShadow;
    EditText pickerHeaderSearchView;
    RecyclerView pickerOptionsRecycler;
    ImageView pickerSearchView;
    View replyBoxView;
    ImageButton replyButton;
    EditText replyField;
    TextView replyValidationFailedView;
    View scrollIndicator;
    View scrollJumpButton;
    TextView skipBubbleTextView;
    LinearLayout skipOutterBubble;
    SmartIntentRenderer smartIntentRenderer;
    View unreadMessagesIndicatorDot;

    ConversationalFragmentRenderer(Context context, Window window, RecyclerView recyclerView, View view, View view2, boolean z, boolean z2, View view3, View view4, IToolbarMenuItemRenderer iToolbarMenuItemRenderer, SmartIntentRenderer smartIntentRenderer, ConversationalFragmentRouter conversationalFragmentRouter) {
        this.context = context;
        this.isHSBrandingDisabled = z;
        this.isAvatarEnabledInChatFeed = z2;
        this.listPickerHostWindow = window;
        this.messagesRecyclerView = recyclerView;
        RecyclerView.ItemAnimator itemAnimator = recyclerView.getItemAnimator();
        if (itemAnimator instanceof SimpleItemAnimator) {
            ((SimpleItemAnimator) itemAnimator).setSupportsChangeAnimations(false);
        }
        this.parentView = view;
        View viewFindViewById = view.findViewById(R.id.replyBoxLayout);
        this.replyBoxView = viewFindViewById;
        this.replyField = (EditText) viewFindViewById.findViewById(R.id.hs__messageText);
        this.replyButton = (ImageButton) this.replyBoxView.findViewById(R.id.hs__sendMessageBtn);
        this.addAttachmentButton = (ImageButton) this.replyBoxView.findViewById(R.id.hs__addAttachmentBtn);
        this.replyButton.setImageDrawable(context.getResources().getDrawable(Styles.getResourceIdForAttribute(context, R.attr.hs__messageSendIcon)).mutate());
        this.scrollJumpButton = view.findViewById(R.id.scroll_jump_button);
        this.confirmationBoxView = view2;
        this.conversationalFragmentRouter = conversationalFragmentRouter;
        this.menuItemRenderer = iToolbarMenuItemRenderer;
        this.smartIntentRenderer = smartIntentRenderer;
        this.scrollIndicator = view3;
        this.unreadMessagesIndicatorDot = view4;
        this.skipBubbleTextView = (TextView) view.findViewById(R.id.skipBubbleTextView);
        this.skipOutterBubble = (LinearLayout) view.findViewById(R.id.skipOuterBubble);
        this.replyValidationFailedView = (TextView) view.findViewById(R.id.errorReplyTextView);
        this.networkErrorFooter = (LinearLayout) view.findViewById(R.id.networkErrorFooter);
        this.conversationalFragmentRouter = conversationalFragmentRouter;
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showOptionInput(OptionInput optionInput) {
        if (optionInput == null) {
            resetReplyFieldToNormalTextInput();
            return;
        }
        hideSendReplyUI();
        hideKeyboard();
        setMessagesViewBottomPadding();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showSkipButton() {
        com.helpshift.util.Styles.setColorFilter(this.parentView.getContext(), this.skipBubbleTextView.getBackground(), R.attr.hs__selectableOptionColor);
        com.helpshift.util.Styles.setColorFilter(this.parentView.getContext(), this.skipOutterBubble.getBackground(), android.R.attr.windowBackground);
        this.skipOutterBubble.setVisibility(0);
        this.messagesRecyclerView.removeItemDecoration(this.lastMessageItemDecor);
        createRecyclerViewLastItemDecor();
        this.messagesRecyclerView.addItemDecoration(this.lastMessageItemDecor);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideSkipButton() {
        this.skipOutterBubble.setVisibility(8);
        this.messagesRecyclerView.removeItemDecoration(this.lastMessageItemDecor);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showReplyValidationFailedError(int i) {
        String string;
        boolean z = this.parentView.getResources().getConfiguration().orientation == 2;
        Resources resources = this.context.getResources();
        if (i == 1) {
            string = resources.getString(R.string.hs__conversation_detail_error);
        } else if (i != 2) {
            if (i != 3) {
                if (i != 4) {
                    string = "";
                } else if (z) {
                    string = resources.getString(R.string.hs__landscape_date_input_validation_error);
                } else {
                    string = resources.getString(R.string.hs__date_input_validation_error);
                }
            } else if (z) {
                string = resources.getString(R.string.hs__landscape_number_input_validation_error);
            } else {
                string = resources.getString(R.string.hs__number_input_validation_error);
            }
        } else if (z) {
            string = resources.getString(R.string.hs__landscape_email_input_validation_error);
        } else {
            string = resources.getString(R.string.hs__email_input_validation_error);
        }
        if (z) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.parentView.getContext());
            builder.setTitle(resources.getString(R.string.hs__landscape_input_validation_dialog_title));
            builder.setCancelable(true);
            builder.setMessage(string);
            builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.1
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i2) {
                    dialogInterface.cancel();
                }
            });
            builder.create().show();
            return;
        }
        this.replyValidationFailedView.setText(string);
        this.replyValidationFailedView.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideReplyValidationFailedError() {
        this.replyValidationFailedView.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showNetworkErrorFooter(int i) {
        this.networkErrorFooter.setVisibility(0);
        TextView textView = (TextView) this.networkErrorFooter.findViewById(R.id.networkErrorFooterText);
        ProgressBar progressBar = (ProgressBar) this.networkErrorFooter.findViewById(R.id.networkErrorProgressBar);
        ImageView imageView = (ImageView) this.networkErrorFooter.findViewById(R.id.networkErrorIcon);
        imageView.setVisibility(0);
        com.helpshift.util.Styles.setDrawable(this.context, imageView, R.drawable.hs__network_error, R.attr.hs__errorTextColor);
        progressBar.setVisibility(8);
        Resources resources = this.context.getResources();
        if (i == 1) {
            textView.setText(resources.getString(R.string.hs__no_internet_error));
        } else {
            if (i != 2) {
                return;
            }
            textView.setText(resources.getString(R.string.hs__network_reconnecting_error));
            imageView.setVisibility(8);
            progressBar.setVisibility(0);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideNetworkErrorFooter() {
        this.networkErrorFooter.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateListPickerOptions(List<OptionUIModel> list) {
        if (this.pickerAdapter != null) {
            showPickerContent();
            this.pickerAdapter.dispatchUpdates(list);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideListPicker(boolean z) {
        BottomSheetBehavior bottomSheetBehavior = this.bottomSheetBehavior;
        if (bottomSheetBehavior == null || this.pickerBottomSheet == null) {
            return;
        }
        if (z) {
            bottomSheetBehavior.setHideable(true);
            this.pickerBottomSheet.removeAllBottomSheetCallbacks();
            this.pickerBottomSheet.addBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.2
                @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                public void onSlide(View view, float f) {
                }

                @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
                public void onStateChanged(View view, int i) {
                    if (i == 5) {
                        ConversationalFragmentRenderer.this.removePickerViewFromWindow();
                    }
                }
            });
            this.bottomSheetBehavior.setState(5);
        } else {
            removePickerViewFromWindow();
        }
        resetAccessibilityForMessageList();
        hideKeyboard();
        setBottomOffset(this.parentView, 0);
        hideSkipButton();
    }

    void removePickerViewFromWindow() {
        this.pickerBottomSheet.remove();
        this.pickerBottomSheet = null;
    }

    private void setBottomOffset(View view, int i) {
        view.setPadding(view.getPaddingLeft(), view.getPaddingTop(), view.getPaddingRight(), (int) com.helpshift.util.Styles.dpToPx(this.context, i));
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showEmptyListPickerView() {
        showEmptyPickerView();
    }

    private void showPickerContent() {
        if (this.pickerEmptySearchResultsView.isShown()) {
            this.pickerEmptySearchResultsView.setVisibility(8);
        }
        if (this.pickerOptionsRecycler.isShown()) {
            return;
        }
        this.pickerOptionsRecycler.setVisibility(0);
    }

    private void showEmptyPickerView() {
        if (!this.pickerEmptySearchResultsView.isShown()) {
            this.pickerEmptySearchResultsView.setVisibility(0);
        }
        if (this.pickerOptionsRecycler.isShown()) {
            this.pickerOptionsRecycler.setVisibility(8);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showListPicker(List<OptionUIModel> list, String str, boolean z, String str2) {
        if (this.pickerBottomSheet != null) {
            handleSkipButtonRenderingForPicker(z, str2);
            return;
        }
        boolean zIsTablet = Styles.isTablet(this.parentView.getContext());
        this.pickerBottomSheet = new HSBottomSheet.Builder(this.listPickerHostWindow).contentView(R.layout.hs__picker_layout).referenceView(this.messagesRecyclerView).enableDimAnimation(true).dimOpacity(zIsTablet ? 0.8f : 1.0f).inflateAndBuild();
        initPickerViews(str);
        this.bottomSheetBehavior.setPeekHeight((int) com.helpshift.util.Styles.dpToPx(this.context, 142.0f));
        PickerAdapter pickerAdapter = new PickerAdapter(list, this.conversationalFragmentRouter);
        this.pickerAdapter = pickerAdapter;
        this.pickerOptionsRecycler.setAdapter(pickerAdapter);
        com.helpshift.util.Styles.setGradientBackground(this.pickerCollapsedShadow, ContextCompat.getColor(this.context, R.color.hs__color_40000000), 0, GradientDrawable.Orientation.BOTTOM_TOP);
        hideSendReplyUI();
        handleSkipButtonRenderingForPicker(z, str2);
        hideKeyboard();
        setBottomOffset(this.parentView, calculatePickerBottomOffset(zIsTablet, OPTIONS_PICKER_PEEK_HEIGHT));
        registerListeners();
        initBottomSheetCallback();
        showPickerContent();
        this.pickerBottomSheet.show();
    }

    private int calculatePickerBottomOffset(boolean z, int i) {
        int i2 = i - (this.isHSBrandingDisabled ? 0 : 14);
        return z ? i2 - 4 : i2;
    }

    private void handleSkipButtonRenderingForPicker(boolean z, String str) {
        if (!z && !StringUtils.isEmpty(str)) {
            setPickerOptionsInputSkipListener();
            this.skipBubbleTextView.setText(str);
            showSkipButton();
            return;
        }
        hideSkipButton();
    }

    private void initBottomSheetCallback() {
        this.pickerBottomSheet.addBottomSheetCallback(new BottomSheetBehavior.BottomSheetCallback() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.3
            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public void onStateChanged(View view, int i) {
                if (4 == i) {
                    ConversationalFragmentRenderer.this.onOptionPickerCollapsed();
                } else if (3 == i) {
                    ConversationalFragmentRenderer.this.onOptionPickerExpanded();
                }
            }

            @Override // com.google.android.material.bottomsheet.BottomSheetBehavior.BottomSheetCallback
            public void onSlide(View view, float f) {
                if (f > 0.5d && ConversationalFragmentRenderer.this.bottomSheetBehavior.getState() == 2) {
                    ConversationalFragmentRenderer.this.onOptionPickerExpanded();
                } else if (ConversationalFragmentRenderer.this.bottomSheetBehavior.getState() == 2) {
                    ConversationalFragmentRenderer.this.onOptionPickerCollapsed();
                }
            }
        });
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hidePickerClearButton() {
        if (this.pickerClearView.isShown()) {
            this.pickerClearView.setVisibility(8);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showPickerClearButton() {
        if (this.pickerClearView.isShown()) {
            return;
        }
        this.pickerClearView.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public boolean handleBackPressedForListPicker() {
        if (this.pickerBottomSheet == null || this.bottomSheetBehavior.getState() != 3) {
            return false;
        }
        this.bottomSheetBehavior.setState(4);
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onOptionPickerExpanded() {
        this.pickerCollapsedShadow.setVisibility(8);
        com.helpshift.util.Styles.setGradientBackground(this.pickerExpandedShadow, ContextCompat.getColor(this.context, R.color.hs__color_40000000), 0, GradientDrawable.Orientation.TOP_BOTTOM);
        this.pickerExpandedHeader.setVisibility(0);
        this.pickerCollapsedHeader.setVisibility(8);
        disableAccessibilityForMessageList();
    }

    private void disableAccessibilityForMessageList() {
        View view;
        if (Build.VERSION.SDK_INT < 19 || (view = this.parentView) == null) {
            return;
        }
        view.setImportantForAccessibility(4);
        this.conversationalFragmentRouter.setToolbarImportanceForAccessibility(4);
    }

    private void resetAccessibilityForMessageList() {
        View view;
        if (Build.VERSION.SDK_INT < 19 || (view = this.parentView) == null) {
            return;
        }
        view.setImportantForAccessibility(0);
        this.conversationalFragmentRouter.resetToolbarImportanceForAccessibility();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onOptionPickerCollapsed() {
        this.pickerCollapsedShadow.setVisibility(0);
        com.helpshift.util.Styles.setGradientBackground(this.pickerCollapsedShadow, ContextCompat.getColor(this.context, R.color.hs__color_40000000), 0, GradientDrawable.Orientation.BOTTOM_TOP);
        showPickerContent();
        resetPickerSearchViewToNormalHeader();
        this.pickerCollapsedHeader.setVisibility(0);
        this.pickerExpandedHeader.setVisibility(8);
        this.pickerOptionsRecycler.scrollToPosition(0);
        resetAccessibilityForMessageList();
    }

    private void registerListeners() {
        this.pickerHeaderSearchView.addTextChangedListener(new TextWatcherAdapter() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.4
            @Override // com.helpshift.support.conversations.TextWatcherAdapter, android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                if (charSequence != null) {
                    ConversationalFragmentRenderer.this.conversationalFragmentRouter.onListPickerSearchQueryChange(charSequence.toString());
                }
            }
        });
        this.pickerHeaderSearchView.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.5
            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                if (i != 3) {
                    return false;
                }
                ConversationalFragmentRenderer.this.hideKeyboard();
                return true;
            }
        });
        this.pickerSearchView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.pickerHeaderSearchView.setVisibility(0);
                ConversationalFragmentRenderer.this.pickerExpandedHeaderText.setVisibility(8);
                ConversationalFragmentRenderer.this.pickerSearchView.setVisibility(8);
                ConversationalFragmentRenderer.this.pickerHeaderSearchView.requestFocus();
                ConversationalFragmentRenderer.this.pickerBottomSheet.setDraggable(false);
                ConversationalFragmentRenderer.this.pickerCollapseView.setVisibility(8);
                ConversationalFragmentRenderer.this.pickerBackView.setVisibility(0);
                KeyboardUtil.showKeyboard(ConversationalFragmentRenderer.this.context, ConversationalFragmentRenderer.this.pickerHeaderSearchView);
                ConversationalFragmentRenderer.this.pickerBottomSheet.setDraggable(false);
            }
        });
        this.pickerBackView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.resetPickerSearchViewToNormalHeader();
            }
        });
        this.pickerClearView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.pickerHeaderSearchView.setText("");
                ConversationalFragmentRenderer.this.pickerClearView.setVisibility(8);
            }
        });
        this.pickerCollapseView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.9
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.bottomSheetBehavior.setState(4);
                ConversationalFragmentRenderer.this.hideKeyboard();
            }
        });
        this.pickerCollapsedHeader.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.10
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.bottomSheetBehavior.setState(3);
            }
        });
    }

    void resetPickerSearchViewToNormalHeader() {
        this.pickerHeaderSearchView.setVisibility(8);
        this.pickerExpandedHeaderText.setVisibility(0);
        this.pickerHeaderSearchView.setText("");
        this.pickerBackView.setVisibility(8);
        this.pickerCollapseView.setVisibility(0);
        this.pickerClearView.setVisibility(8);
        this.pickerSearchView.setVisibility(0);
        hideKeyboard();
        this.pickerBottomSheet.setDraggable(true);
    }

    private void initPickerViews(String str) {
        this.bottomSheetBehavior = this.pickerBottomSheet.getBottomSheetBehaviour();
        View bottomSheetContentView = this.pickerBottomSheet.getBottomSheetContentView();
        this.pickerCollapsedShadow = bottomSheetContentView.findViewById(R.id.hs__picker_collapsed_shadow);
        this.pickerExpandedShadow = bottomSheetContentView.findViewById(R.id.hs__picker_expanded_shadow);
        RecyclerView recyclerView = (RecyclerView) bottomSheetContentView.findViewById(R.id.hs__optionsList);
        this.pickerOptionsRecycler = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(bottomSheetContentView.getContext(), 1, false));
        this.pickerSearchView = (ImageView) bottomSheetContentView.findViewById(R.id.hs__picker_action_search);
        this.pickerClearView = (ImageView) bottomSheetContentView.findViewById(R.id.hs__picker_action_clear);
        this.pickerCollapseView = (ImageView) bottomSheetContentView.findViewById(R.id.hs__picker_action_collapse);
        this.pickerBackView = (ImageView) bottomSheetContentView.findViewById(R.id.hs__picker_action_back);
        this.pickerHeaderSearchView = (EditText) bottomSheetContentView.findViewById(R.id.hs__picker_header_search);
        this.pickerExpandedHeaderText = (TextView) bottomSheetContentView.findViewById(R.id.hs__expanded_picker_header_text);
        this.pickerExpandedHeader = bottomSheetContentView.findViewById(R.id.hs__picker_expanded_header);
        this.pickerCollapsedHeader = bottomSheetContentView.findViewById(R.id.hs__picker_collapsed_header);
        this.pickerCollapsedHeaderText = (TextView) bottomSheetContentView.findViewById(R.id.hs__collapsed_picker_header_text);
        this.pickerEmptySearchResultsView = bottomSheetContentView.findViewById(R.id.hs__empty_picker_view);
        this.pickerExpandView = (ImageView) bottomSheetContentView.findViewById(R.id.hs__picker_action_expand);
        this.pickerExpandedHeaderText.setText(str);
        this.pickerCollapsedHeaderText.setText(str);
        String string = this.parentView.getResources().getString(R.string.hs__picker_options_expand_header_voice_over, str);
        this.pickerCollapsedHeader.setContentDescription(string);
        this.pickerCollapsedHeaderText.setContentDescription(string);
        com.helpshift.util.Styles.setColorFilter(this.context, this.pickerSearchView.getDrawable(), R.attr.hs__expandedPickerIconColor);
        com.helpshift.util.Styles.setColorFilter(this.context, this.pickerBackView.getDrawable(), R.attr.hs__expandedPickerIconColor);
        com.helpshift.util.Styles.setColorFilter(this.context, this.pickerCollapseView.getDrawable(), R.attr.hs__expandedPickerIconColor);
        com.helpshift.util.Styles.setColorFilter(this.context, this.pickerClearView.getDrawable(), R.attr.hs__expandedPickerIconColor);
        com.helpshift.util.Styles.setColorFilter(this.context, this.pickerExpandView.getDrawable(), R.attr.hs__collapsedPickerIconColor);
    }

    private void resetReplyFieldToNormalTextInput() {
        this.replyField.setInputType(147457);
        this.replyField.setHint(R.string.hs__chat_hint);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void onFocusChanged(boolean z) {
        if (z) {
            return;
        }
        hideListPicker(true);
        this.smartIntentRenderer.dismissSmartIntentUI(false);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showSmartIntentView(SmartIntentCollapsedRootViewState smartIntentCollapsedRootViewState) {
        hideKeyboard();
        this.smartIntentRenderer.showSmartIntentUI(smartIntentCollapsedRootViewState);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideSmartIntentView() {
        hideKeyboard();
        this.smartIntentRenderer.dismissSmartIntentUI(true);
        resetAccessibilityForMessageList();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateSmartIntentView(BaseSmartIntentViewState baseSmartIntentViewState) {
        this.smartIntentRenderer.updateSmartIntentView(baseSmartIntentViewState);
        if (this.smartIntentRenderer.isUIInExpandedMode()) {
            disableAccessibilityForMessageList();
        } else {
            resetAccessibilityForMessageList();
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public String getSmartIntentUserQuery() {
        return this.smartIntentRenderer.getReply();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showSmartIntentReplyValidationFailedError() {
        this.smartIntentRenderer.showReplyValidationFailedError();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideSmartIntentReplyValidationFailedError() {
        this.smartIntentRenderer.hideReplyValidationFailedError();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showAttachmentPicker(List<Integer> list) {
        AttachmentTypeOptionPicker attachmentTypeOptionPicker = new AttachmentTypeOptionPicker(this.context);
        this.attachmentPicker = attachmentTypeOptionPicker;
        attachmentTypeOptionPicker.setListener(new AttachmentTypeOptionPicker.OnAttachmentTypeOptionClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.11
            @Override // com.helpshift.support.widget.AttachmentTypeOptionPicker.OnAttachmentTypeOptionClickListener
            public void launchAttachmentPicker(int i) {
                ConversationalFragmentRenderer.this.conversationalFragmentRouter.launchAttachmentPicker(i);
            }
        });
        this.attachmentPicker.showAttachmentPicker(this.addAttachmentButton, list);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void openActionLink(String str) {
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
        intent.putExtra("origin", "helpshift");
        try {
            this.context.startActivity(intent);
        } catch (Exception unused) {
            showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void destroy() {
        hideListPicker(true);
        this.smartIntentRenderer.dismissSmartIntentUI(false);
        hideAttachmentPicker();
        this.conversationalFragmentRouter = null;
    }

    private void showSendReplyUI(Input input) {
        if (input == null) {
            setMessagesViewBottomPadding();
            this.replyBoxView.setVisibility(0);
            ((LinearLayout) this.parentView.findViewById(R.id.replyBoxLabelLayout)).setVisibility(8);
            this.replyField.setFocusableInTouchMode(true);
            this.replyField.setOnClickListener(null);
            resetReplyFieldToNormalTextInput();
            hideSkipButton();
            return;
        }
        if (input instanceof TextInput) {
            renderForTextInput((TextInput) input);
        }
        setMessagesViewBottomPadding();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideSendReplyUI() {
        this.messagesRecyclerView.setPadding(0, 0, 0, 0);
        this.replyBoxView.setVisibility(8);
        hideSkipButton();
        hideAttachmentPicker();
    }

    private void hideAttachmentPicker() {
        AttachmentTypeOptionPicker attachmentTypeOptionPicker = this.attachmentPicker;
        if (attachmentTypeOptionPicker != null) {
            attachmentTypeOptionPicker.dismissAttachmentPicker();
        }
    }

    private void setTextInputSkipListener() {
        this.skipBubbleTextView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.12
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.conversationalFragmentRouter.onSkipClick();
            }
        });
    }

    private void setPickerOptionsInputSkipListener() {
        this.skipBubbleTextView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.13
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ConversationalFragmentRenderer.this.conversationalFragmentRouter.handleOptionSelectedForPicker(null, true);
            }
        });
    }

    private void createRecyclerViewLastItemDecor() {
        if (this.lastMessageItemDecor != null) {
            return;
        }
        this.lastMessageItemDecor = new RecyclerView.ItemDecoration() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.14
            @Override // androidx.recyclerview.widget.RecyclerView.ItemDecoration
            public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, RecyclerView.State state) {
                RecyclerView.Adapter adapter;
                int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
                if (childAdapterPosition != -1 && (adapter = recyclerView.getAdapter()) != null && ConversationalFragmentRenderer.this.skipOutterBubble.getVisibility() == 0 && childAdapterPosition == adapter.getItemCount() - 1) {
                    rect.set(rect.left, rect.top, rect.right, (int) TypedValue.applyDimension(1, 80.0f, recyclerView.getContext().getResources().getDisplayMetrics()));
                }
            }
        };
    }

    DatePickerDialog createDatePickerForReplyField() {
        DatePickerDialog.OnDateSetListener onDateSetListener = new DatePickerDialog.OnDateSetListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.15
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker datePicker, int i, int i2, int i3) {
                Calendar calendar = Calendar.getInstance();
                calendar.set(i, i2, i3);
                ConversationalFragmentRenderer.this.replyField.setText(HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, HelpshiftContext.getCoreApi().getLocaleProviderDM().getCurrentLocale()).format(calendar.getTime()));
            }
        };
        Calendar calendar = Calendar.getInstance();
        try {
            String string = this.replyField.getText().toString();
            if (!StringUtils.isEmpty(string)) {
                calendar.setTime(HSDateFormatSpec.getDateFormatter(HSDateFormatSpec.DISPLAY_DATE_PATTERN, HelpshiftContext.getCoreApi().getLocaleProviderDM().getCurrentLocale()).parse(string));
            }
        } catch (ParseException unused) {
        }
        return new DatePickerDialog(this.parentView.getContext(), onDateSetListener, calendar.get(1), calendar.get(2), calendar.get(5));
    }

    private void renderForTextInput(TextInput textInput) {
        this.replyField.setFocusableInTouchMode(true);
        this.replyField.setOnClickListener(null);
        if (!TextUtils.isEmpty(textInput.inputLabel)) {
            ((LinearLayout) this.parentView.findViewById(R.id.replyBoxLabelLayout)).setVisibility(0);
            ((TextView) this.replyBoxView.findViewById(R.id.replyFieldLabel)).setText(textInput.inputLabel);
        }
        this.replyField.setHint(TextUtils.isEmpty(textInput.placeholder) ? "" : textInput.placeholder);
        int i = 131072;
        int i2 = textInput.keyboard;
        if (i2 == 1) {
            i = 147457;
        } else if (i2 == 2) {
            i = 131105;
        } else if (i2 == 3) {
            i = 139266;
        } else if (i2 == 4) {
            hideKeyboard();
            this.replyField.setFocusableInTouchMode(false);
            this.replyField.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.16
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    ConversationalFragmentRenderer.this.createDatePickerForReplyField().show();
                }
            });
            i = 0;
        } else {
            resetReplyFieldToNormalTextInput();
        }
        this.replyField.setInputType(i);
        if (!textInput.required && !TextUtils.isEmpty(textInput.skipLabel)) {
            setTextInputSkipListener();
            this.skipBubbleTextView.setText(textInput.skipLabel);
            showSkipButton();
        } else {
            hideSkipButton();
        }
        this.replyBoxView.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void initializeMessages(List<MessageDM> list) {
        this.messagesAdapter = new MessagesAdapter(this.context, list, this.isAvatarEnabledInChatFeed, this.conversationalFragmentRouter);
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this.context);
        linearLayoutManager.setStackFromEnd(true);
        this.messagesRecyclerView.setLayoutManager(linearLayoutManager);
        this.messagesRecyclerView.setAdapter(this.messagesAdapter);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void appendMessages(int i, int i2) {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter == null) {
            return;
        }
        messagesAdapter.onItemRangeInserted(i, i2);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateMessages(int i, int i2) {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter == null) {
            return;
        }
        if (i == 0 && i2 == messagesAdapter.getMessageCount()) {
            this.messagesAdapter.notifyDataSetChanged();
        } else {
            this.messagesAdapter.onItemRangeChanged(i, i2);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void removeMessages(int i, int i2) {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter == null) {
            return;
        }
        messagesAdapter.onItemRangeRemoved(i, i2);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateImageAttachmentButtonView(boolean z) {
        if (z) {
            this.addAttachmentButton.setVisibility(0);
        } else {
            this.addAttachmentButton.setVisibility(8);
            hideAttachmentPicker();
            changeMenuItemVisibility(HSMenuItemType.SCREENSHOT_ATTACHMENT, false);
        }
        setPaddingForReplyField(z);
    }

    private void setPaddingForReplyField(boolean z) {
        this.replyField.setPadding(!z ? (int) this.context.getResources().getDimension(R.dimen.activity_horizontal_margin_medium) : 0, 0, 0, 0);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateSendReplyButton(boolean z) {
        if (z) {
            enableSendReplyButton();
        } else {
            disableSendReplyButton();
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void enableSendReplyButton() {
        this.replyButton.setEnabled(true);
        Styles.setImageAlpha(this.replyButton, 255);
        Styles.setSendMessageButtonIconColor(this.context, this.replyButton.getDrawable(), true);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void disableSendReplyButton() {
        this.replyButton.setEnabled(false);
        Styles.setImageAlpha(this.replyButton, Styles.getInt(this.context, R.attr.hs__reply_button_disabled_alpha));
        Styles.setSendMessageButtonIconColor(this.context, this.replyButton.getDrawable(), false);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public String getReply() {
        return this.replyField.getText().toString();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void setReply(String str) {
        this.replyField.setText(str);
        EditText editText = this.replyField;
        editText.setSelection(editText.getText().length());
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateConversationResolutionQuestionUI(boolean z) {
        if (z) {
            hideKeyboard();
            this.confirmationBoxView.setVisibility(0);
        } else {
            this.confirmationBoxView.setVisibility(8);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void updateSendReplyUI(boolean z, Input input) {
        if (z) {
            showSendReplyUI(input);
        } else {
            hideSendReplyUI();
        }
    }

    private void launchAttachmentIntentInternal(Intent intent, Uri uri) {
        try {
            this.context.startActivity(intent);
        } catch (Exception unused) {
            if (HelpshiftContext.getCoreApi().getDelegate().isDelegateRegistered()) {
                RootDelegate delegate = HelpshiftContext.getCoreApi().getDelegate().getDelegate();
                if (delegate instanceof Support.Delegate) {
                    ((Support.Delegate) delegate).displayAttachmentFile(uri);
                    return;
                } else {
                    showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
                    return;
                }
            }
            showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
        }
    }

    private void launchAttachmentIntentInternal(Intent intent, File file) {
        try {
            this.context.startActivity(intent);
        } catch (Exception unused) {
            if (HelpshiftContext.getCoreApi().getDelegate().isDelegateRegistered()) {
                HelpshiftContext.getCoreApi().getDelegate().displayAttachmentFile(file);
            } else {
                showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
            }
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void launchScreenshotAttachment(String str, String str2) {
        File fileValidateAndCreateFile = FileUtil.validateAndCreateFile(str);
        if (fileValidateAndCreateFile != null) {
            launchAttachmentIntentInternal(IntentUtil.createFileProviderIntent(this.context, fileValidateAndCreateFile, str2), fileValidateAndCreateFile);
        } else {
            showErrorView(PlatformException.FILE_NOT_FOUND);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void launchAttachment(String str, String str2) {
        Intent intentCreateFileProviderIntent;
        if (HsUriUtils.isValidUriPath(str)) {
            Uri uri = Uri.parse(str);
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setFlags(1);
            intent.setDataAndType(uri, str2);
            launchAttachmentIntentInternal(intent, uri);
            return;
        }
        File fileValidateAndCreateFile = FileUtil.validateAndCreateFile(str);
        if (fileValidateAndCreateFile != null) {
            if (Build.VERSION.SDK_INT >= 24) {
                intentCreateFileProviderIntent = IntentUtil.createFileProviderIntent(this.context, fileValidateAndCreateFile, str2);
            } else {
                Intent intent2 = new Intent("android.intent.action.VIEW");
                intent2.setDataAndType(Uri.fromFile(fileValidateAndCreateFile), str2);
                intentCreateFileProviderIntent = intent2;
            }
            launchAttachmentIntentInternal(intentCreateFileProviderIntent, fileValidateAndCreateFile);
            return;
        }
        showErrorView(PlatformException.FILE_NOT_FOUND);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showErrorView(ExceptionType exceptionType) {
        SnackbarUtil.showSnackbar(exceptionType, this.parentView);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void openAppReviewStore(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(str));
        try {
            this.context.startActivity(intent);
        } catch (Exception unused) {
            showErrorView(PlatformException.NO_APPS_FOR_OPENING_ATTACHMENT);
        }
    }

    public void updateConversationFooterState(ConversationFooterState conversationFooterState) {
        if (this.messagesAdapter != null) {
            if (conversationFooterState != ConversationFooterState.NONE) {
                hideKeyboard();
            }
            this.messagesAdapter.setConversationFooterState(conversationFooterState);
        }
    }

    public void updateHistoryLoadingState(HistoryLoadingState historyLoadingState) {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null) {
            messagesAdapter.setHistoryLoadingState(historyLoadingState);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showCSATSubmittedView() {
        SnackbarUtil.showSnackbar(this.parentView, this.context.getResources().getString(R.string.hs__csat_submit_toast), 0);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void openFreshConversationScreen(Map<String, Boolean> map) {
        this.conversationalFragmentRouter.openFreshConversationScreen(map);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showAgentTypingIndicator() {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null) {
            messagesAdapter.setAgentTypingIndicatorVisibility(true);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideAgentTypingIndicator() {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null) {
            messagesAdapter.setAgentTypingIndicatorVisibility(false);
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void onAuthenticationFailure() {
        ConversationalFragmentRouter conversationalFragmentRouter = this.conversationalFragmentRouter;
        if (conversationalFragmentRouter != null) {
            conversationalFragmentRouter.onAuthenticationFailure();
        }
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public boolean isReplyBoxVisible() {
        return this.replyBoxView.getVisibility() == 0;
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void setReplyboxListeners() {
        this.replyField.addTextChangedListener(new TextWatcherAdapter() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.17
            @Override // com.helpshift.support.conversations.TextWatcherAdapter, android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
                if (ConversationalFragmentRenderer.this.conversationalFragmentRouter != null) {
                    ConversationalFragmentRenderer.this.conversationalFragmentRouter.onTextChanged(charSequence, i, i2, i3);
                }
            }
        });
        this.replyField.setOnEditorActionListener(new TextView.OnEditorActionListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.18
            @Override // android.widget.TextView.OnEditorActionListener
            public boolean onEditorAction(TextView textView, int i, KeyEvent keyEvent) {
                if (i != 4) {
                    return false;
                }
                ConversationalFragmentRenderer.this.replyButton.performClick();
                return false;
            }
        });
        this.replyButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.19
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ConversationalFragmentRenderer.this.conversationalFragmentRouter != null) {
                    ConversationalFragmentRenderer.this.conversationalFragmentRouter.onSendButtonClick();
                }
            }
        });
        this.addAttachmentButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragmentRenderer.20
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ConversationalFragmentRenderer.this.conversationalFragmentRouter != null) {
                    ConversationalFragmentRenderer.this.conversationalFragmentRouter.onAddAttachmentButtonClick();
                }
            }
        });
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void requestReplyFieldFocus() {
        this.replyField.requestFocus();
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void showKeyboard() {
        KeyboardUtil.showKeyboard(this.context, this.replyField);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void hideKeyboard() {
        KeyboardUtil.hideKeyboard(this.context, this.replyField);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void notifyRefreshList() {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null) {
            messagesAdapter.notifyDataSetChanged();
        }
    }

    public void updateScrollJumperView(boolean z, boolean z2) {
        if (z) {
            showScrollJumperView(z2);
        } else {
            hideScrollJumperView();
        }
    }

    private void showScrollJumperView(boolean z) {
        String string;
        this.scrollIndicator.setVisibility(0);
        if (z) {
            this.unreadMessagesIndicatorDot.setVisibility(0);
            string = this.context.getString(R.string.hs__jump_button_with_new_message_voice_over);
        } else {
            this.unreadMessagesIndicatorDot.setVisibility(8);
            string = this.context.getString(R.string.hs__jump_button_voice_over);
        }
        this.scrollJumpButton.setContentDescription(string);
    }

    private void hideScrollJumperView() {
        this.scrollIndicator.setVisibility(8);
        this.unreadMessagesIndicatorDot.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.ConversationalRenderer
    public void scrollToBottom() {
        int itemCount;
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null && (itemCount = messagesAdapter.getItemCount()) > 0) {
            this.messagesRecyclerView.scrollToPosition(itemCount - 1);
        }
    }

    protected void setMessagesViewBottomPadding() {
        this.messagesRecyclerView.setPadding(0, 0, 0, (int) com.helpshift.util.Styles.dpToPx(this.context, 12.0f));
    }

    private void changeMenuItemVisibility(HSMenuItemType hSMenuItemType, boolean z) {
        IToolbarMenuItemRenderer iToolbarMenuItemRenderer = this.menuItemRenderer;
        if (iToolbarMenuItemRenderer != null) {
            iToolbarMenuItemRenderer.updateMenuItemVisibility(hSMenuItemType, z);
        }
    }

    public void unregisterFragmentRenderer() {
        MessagesAdapter messagesAdapter = this.messagesAdapter;
        if (messagesAdapter != null) {
            messagesAdapter.unregisterAdapterClickListener();
        }
    }

    public void updateSmartIntentReplyButton(boolean z, boolean z2) {
        this.smartIntentRenderer.updateReplyButtonViewState(z, z2);
    }

    public void updateSmartIntentClearSearchButton(boolean z) {
        this.smartIntentRenderer.updateClearSearchButton(z);
    }

    public void setSmartIntentReply(String str) {
        this.smartIntentRenderer.setReply(str);
    }
}

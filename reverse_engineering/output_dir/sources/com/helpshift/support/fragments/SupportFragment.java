package com.helpshift.support.fragments;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.Transformation;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.appcompat.widget.Toolbar;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import com.helpshift.CoreApi;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.support.ContactUsFilter;
import com.helpshift.support.HSSearch;
import com.helpshift.support.activities.ParentActivity;
import com.helpshift.support.compositions.FaqFragment;
import com.helpshift.support.compositions.SectionPagerFragment;
import com.helpshift.support.contracts.SupportScreenView;
import com.helpshift.support.controllers.FaqFlowController;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.conversations.AuthenticationFailureFragment;
import com.helpshift.support.conversations.BaseConversationFragment;
import com.helpshift.support.conversations.ConversationalFragment;
import com.helpshift.support.conversations.NewConversationFragment;
import com.helpshift.support.conversations.messages.AvatarImageLoader;
import com.helpshift.support.conversations.usersetup.ConversationSetupFragment;
import com.helpshift.support.fragments.AttachmentPreviewFragment;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.support.widget.AttachmentPicker;
import com.helpshift.util.FetchDataFromThread;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.LocaleContextUtil;
import com.helpshift.util.StringUtils;
import com.helpshift.util.Styles;
import com.helpshift.views.CircleImageView;
import com.helpshift.views.HSMenuItemCompat;
import com.helpshift.views.HSTextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: loaded from: classes2.dex */
public class SupportFragment extends MainFragment implements View.OnClickListener, SupportScreenView, FetchDataFromThread<Integer, Integer>, AttachmentPicker.AttachmentPickerListener, MenuItem.OnMenuItemClickListener, IToolbarMenuItemRenderer {
    public static final String SUPPORT_MODE = "support_mode";
    private static final String TAG = "Helpshift_SupportFrag";
    private MenuItem attachImageMenuItem;
    private FrameLayout bottomSheetContainer;
    MenuItem contactUsMenuItem;
    private MenuItem doneMenuItem;
    private int embeddedToolbarId;
    private Toolbar embeddedToolbarView;
    private int embeddedToolbarViewImportanceForAccessibility;
    private boolean faqLoaded;
    private List<Integer> fragmentMenuItems;
    private boolean handleNewIntent;
    private Toolbar hsToolbarView;
    private AttachmentPicker imagePicker;
    private boolean isEmbedded;
    private boolean isForeground;
    private boolean isNoOpMode;
    private WeakReference<IMenuItemEventListener> menuItemEventListener;
    private boolean menuItemsPrepared;
    private Bundle newIntentData;
    private MenuItem searchMenuItem;
    private SearchView searchView;
    private MenuItem startNewConversationMenuItem;
    private SupportController supportController;
    private LinearLayout supportUIContainer;
    private View viewFaqsLoadError;
    private View viewFaqsLoading;
    private View viewNoFaqs;
    private final List<String> visibleFragments = Collections.synchronizedList(new ArrayList());
    private int newMessageCount = 0;

    public static class SupportModes {
        public static final int CONVERSATION = 1;
        public static final int DYNAMIC_FORM = 4;
        public static final int FAQ_SECTION = 2;
        public static final int SINGLE_QUESTION = 3;
    }

    @Override // com.helpshift.util.FetchDataFromThread
    public void onFailure(Integer num) {
    }

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return false;
    }

    public static SupportFragment newInstance(Bundle bundle) {
        SupportFragment supportFragment = new SupportFragment();
        supportFragment.setArguments(bundle);
        return supportFragment;
    }

    public SupportController getSupportController() {
        return this.supportController;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
            HelpshiftContext.getPlatform().setUIContext(getContext());
            setRetainInstance(true);
            SupportController supportController = this.supportController;
            if (supportController == null) {
                this.supportController = new SupportController(HelpshiftContext.getApplicationContext(), this, getRetainedChildFragmentManager(), getArguments());
            } else {
                supportController.onFragmentManagerUpdate(getRetainedChildFragmentManager());
            }
            if (isChangingConfigurations()) {
                return;
            }
            HelpshiftContext.getCoreApi().getConversationInboxPoller().startAppPoller(true);
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in SupportFragment.onAttach()", e);
            this.isNoOpMode = true;
        }
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStart() {
        AnalyticsEventType analyticsEventType;
        super.onStart();
        if (getArguments() == null) {
            quitSupportFragment();
            return;
        }
        if (!isChangingConfigurations()) {
            HSLogger.d(TAG, "Helpshift session began.");
            HSSearch.init();
            if (getArguments().getInt(SUPPORT_MODE, 0) == 0) {
                analyticsEventType = AnalyticsEventType.LIBRARY_OPENED;
            } else {
                analyticsEventType = AnalyticsEventType.LIBRARY_OPENED_DECOMP;
            }
            HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(analyticsEventType);
            if (this.handleNewIntent) {
                this.supportController.onNewIntent(this.newIntentData);
                this.handleNewIntent = false;
            }
            HelpshiftContext.getCoreApi().onSDKSessionStarted();
        }
        this.isForeground = true;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onPause() {
        if (!getActivity(this).isChangingConfigurations()) {
            stopLiveUpdates();
        }
        super.onPause();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        if (!isChangingConfigurations()) {
            HSLogger.d(TAG, "Helpshift session ended.");
            CoreApi coreApi = HelpshiftContext.getCoreApi();
            HSSearch.deinit();
            coreApi.getAnalyticsEventDM().pushEvent(AnalyticsEventType.LIBRARY_QUIT);
            this.isForeground = false;
            coreApi.sendAnalyticsEvent();
            coreApi.onSDKSessionEnded();
        }
        HelpshiftContext.getCoreApi().getConversationController().fetchConversationUpdatesListenerReference = null;
        super.onStop();
    }

    private int getMenuResourceId() {
        return R.menu.hs__support_fragment;
    }

    private void attachMenuListeners(Menu menu) {
        MenuItem menuItemFindItem = menu.findItem(R.id.hs__search);
        this.searchMenuItem = menuItemFindItem;
        this.searchView = (SearchView) HSMenuItemCompat.getActionView(menuItemFindItem);
        MenuItem menuItemFindItem2 = menu.findItem(R.id.hs__contact_us);
        this.contactUsMenuItem = menuItemFindItem2;
        menuItemFindItem2.setTitle(R.string.hs__contact_us_btn);
        this.contactUsMenuItem.setOnMenuItemClickListener(this);
        HSMenuItemCompat.getActionView(this.contactUsMenuItem).setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.fragments.SupportFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SupportFragment supportFragment = SupportFragment.this;
                supportFragment.onMenuItemClick(supportFragment.contactUsMenuItem);
            }
        });
        MenuItem menuItemFindItem3 = menu.findItem(R.id.hs__action_done);
        this.doneMenuItem = menuItemFindItem3;
        menuItemFindItem3.setOnMenuItemClickListener(this);
        MenuItem menuItemFindItem4 = menu.findItem(R.id.hs__start_new_conversation);
        this.startNewConversationMenuItem = menuItemFindItem4;
        menuItemFindItem4.setOnMenuItemClickListener(this);
        MenuItem menuItemFindItem5 = menu.findItem(R.id.hs__attach_screenshot);
        this.attachImageMenuItem = menuItemFindItem5;
        menuItemFindItem5.setOnMenuItemClickListener(this);
        this.menuItemsPrepared = true;
        setSearchListeners(null);
        refreshMenu();
    }

    @Override // android.view.MenuItem.OnMenuItemClickListener
    public boolean onMenuItemClick(MenuItem menuItem) {
        int itemId = menuItem.getItemId();
        if (itemId == R.id.hs__contact_us) {
            this.supportController.onContactUsClicked(null);
            return true;
        }
        if (itemId == R.id.hs__action_done) {
            this.supportController.actionDone();
            return true;
        }
        if (itemId == R.id.hs__start_new_conversation) {
            sendMenuEventClickEvent(HSMenuItemType.START_NEW_CONVERSATION);
            return true;
        }
        if (itemId != R.id.hs__attach_screenshot) {
            return false;
        }
        sendMenuEventClickEvent(HSMenuItemType.SCREENSHOT_ATTACHMENT);
        return true;
    }

    private void sendMenuEventClickEvent(HSMenuItemType hSMenuItemType) {
        WeakReference<IMenuItemEventListener> weakReference = this.menuItemEventListener;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        this.menuItemEventListener.get().onMenuItemClicked(hSMenuItemType);
    }

    public void unRegisterSearchListener() {
        if (this.menuItemsPrepared) {
            HSMenuItemCompat.setOnActionExpandListener(this.searchMenuItem, null);
            this.searchView.setOnQueryTextListener(null);
        }
    }

    public void setSearchListeners(FaqFlowController faqFlowController) {
        FaqFlowFragment faqFlowFragment;
        if (this.menuItemsPrepared) {
            if (faqFlowController == null && (faqFlowFragment = FragmentUtil.getFaqFlowFragment(getRetainedChildFragmentManager())) != null) {
                faqFlowController = faqFlowFragment.getFaqFlowController();
            }
            if (faqFlowController != null) {
                HSMenuItemCompat.setOnActionExpandListener(this.searchMenuItem, faqFlowController);
                this.searchView.setOnQueryTextListener(faqFlowController);
            }
        }
    }

    private void setMenuItemColors() {
        Context context = getContext();
        Styles.setActionButtonIconColor(context, this.searchMenuItem.getIcon());
        Styles.setActionButtonIconColor(context, this.contactUsMenuItem.getIcon());
        Styles.setActionButtonIconColor(context, ((TextView) HSMenuItemCompat.getActionView(this.contactUsMenuItem).findViewById(R.id.hs__notification_badge)).getBackground());
        Styles.setActionButtonIconColor(context, this.doneMenuItem.getIcon());
        Styles.setActionButtonIconColor(context, this.startNewConversationMenuItem.getIcon());
        Styles.setActionButtonIconColor(context, this.attachImageMenuItem.getIcon());
    }

    private void hideAllMenuItems() {
        this.searchMenuItem.setVisible(false);
        this.contactUsMenuItem.setVisible(false);
        this.doneMenuItem.setVisible(false);
        this.startNewConversationMenuItem.setVisible(false);
        this.attachImageMenuItem.setVisible(false);
    }

    public void addVisibleFragment(String str) {
        this.visibleFragments.add(str);
        refreshMenu();
    }

    public void removeVisibleFragment(String str) {
        this.visibleFragments.remove(str);
    }

    public void onFaqsLoaded() {
        this.faqLoaded = true;
        if (this.menuItemsPrepared) {
            if (this.visibleFragments.contains(FaqFragment.class.getName()) || this.visibleFragments.contains(QuestionListFragment.class.getName())) {
                setSearchMenuVisible(true);
            }
        }
    }

    public void refreshMenu() {
        if (this.menuItemsPrepared) {
            hideAllMenuItems();
            setMenuItemColors();
            synchronized (this.visibleFragments) {
                for (String str : this.visibleFragments) {
                    if (str.equals(FaqFragment.class.getName())) {
                        showFaqFragmentMenu();
                    } else if (str.equals(SearchFragment.class.getName())) {
                        restoreSearchMenuItem();
                    } else {
                        if (str.equals(SingleQuestionFragment.class.getName() + 1)) {
                            showSingleQuestionFragmentMenu();
                        } else if (str.equals(SectionPagerFragment.class.getName())) {
                            showSectionPagerFragmentMenu();
                        } else if (str.equals(QuestionListFragment.class.getName())) {
                            showQuestionListFragmentMenu();
                        } else if (str.equals(NewConversationFragment.class.getName()) || str.equals(ConversationalFragment.class.getName())) {
                            restoreConversationFragmentMenu();
                        } else {
                            if (str.equals(SingleQuestionFragment.class.getName() + 2)) {
                                restoreSingleQuestionDoneModeFragmentMenu();
                            } else if (str.equals(DynamicFormFragment.class.getName())) {
                                showDynamicFormFragmentMenu();
                            } else if (str.equals(ConversationSetupFragment.class.getName()) || str.equals(AuthenticationFailureFragment.class.getName())) {
                                setRetainSearchFragmentState(true);
                                setSearchMenuVisible(false);
                                setContactUsMenuVisible(false);
                            }
                        }
                    }
                }
            }
        }
    }

    private void restoreSingleQuestionDoneModeFragmentMenu() {
        this.doneMenuItem.setVisible(true);
    }

    private void restoreConversationFragmentMenu() {
        setRetainSearchFragmentState(true);
        setSearchMenuVisible(false);
        setContactUsMenuVisible(false);
        BaseConversationFragment baseConversationFragment = (BaseConversationFragment) getRetainedChildFragmentManager().findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        if (baseConversationFragment == null) {
            baseConversationFragment = (BaseConversationFragment) getRetainedChildFragmentManager().findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        }
        if (baseConversationFragment != null) {
            this.doneMenuItem.setVisible(false);
        }
    }

    private void showQuestionListFragmentMenu() {
        setSearchMenuVisible(this.faqLoaded);
        setContactUsMenuVisible(ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.ACTION_BAR));
    }

    private void showSectionPagerFragmentMenu() {
        setSearchMenuVisible(true);
        setContactUsMenuVisible(ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.ACTION_BAR));
    }

    private void showSingleQuestionFragmentMenu() {
        if (!isScreenLarge()) {
            setRetainSearchFragmentState(true);
            setSearchMenuVisible(false);
        }
        setContactUsMenuVisible(ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.QUESTION_ACTION_BAR));
    }

    private void setRetainSearchFragmentState(boolean z) {
        FaqFlowFragment faqFlowFragment = (FaqFlowFragment) getRetainedChildFragmentManager().findFragmentByTag(FaqFlowFragment.FRAGMENT_TAG);
        if (faqFlowFragment == null || faqFlowFragment.getFaqFlowController() == null) {
            return;
        }
        faqFlowFragment.getFaqFlowController().setRetainSearchFragmentState(z);
    }

    private void restoreSearchMenuItem() {
        SearchFragment searchFragment;
        FaqFlowFragment faqFlowFragment = FragmentUtil.getFaqFlowFragment(getRetainedChildFragmentManager());
        if (faqFlowFragment != null && (searchFragment = FragmentUtil.getSearchFragment(faqFlowFragment.getRetainedChildFragmentManager())) != null) {
            setSearchMenuQuery(searchFragment.getCurrentQuery());
        }
        setContactUsMenuVisible(ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.ACTION_BAR));
        setRetainSearchFragmentState(false);
    }

    private void showFaqFragmentMenu() {
        setSearchMenuVisible(this.faqLoaded);
        setContactUsMenuVisible(ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.ACTION_BAR));
    }

    private void showDynamicFormFragmentMenu() {
        setRetainSearchFragmentState(true);
        setContactUsMenuVisible(false);
        setSearchMenuVisible(false);
    }

    public void setContactUsMenuVisible(boolean z) {
        if (HSMenuItemCompat.isActionViewExpanded(this.searchMenuItem)) {
            this.contactUsMenuItem.setVisible(false);
        } else {
            this.contactUsMenuItem.setVisible(z);
        }
        updateBadgeIcon();
    }

    public void setSearchMenuVisible(boolean z) {
        if (HSMenuItemCompat.isActionViewExpanded(this.searchMenuItem) && !this.visibleFragments.contains(SearchFragment.class.getName())) {
            HSMenuItemCompat.collapseActionView(this.searchMenuItem);
        }
        this.searchMenuItem.setVisible(z);
    }

    public void setSearchMenuQuery(String str) {
        if (!HSMenuItemCompat.isActionViewExpanded(this.searchMenuItem)) {
            HSMenuItemCompat.expandActionView(this.searchMenuItem);
        }
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.searchView.setQuery(str, false);
    }

    private void updateBadgeIcon() {
        View actionView;
        MenuItem menuItem = this.contactUsMenuItem;
        if (menuItem == null || !menuItem.isVisible() || (actionView = HSMenuItemCompat.getActionView(this.contactUsMenuItem)) == null) {
            return;
        }
        TextView textView = (TextView) actionView.findViewById(R.id.hs__notification_badge);
        View viewFindViewById = actionView.findViewById(R.id.hs__notification_badge_padding);
        int i = this.newMessageCount;
        if (i != 0) {
            textView.setText(String.valueOf(i));
            viewFindViewById.setVisibility(8);
            textView.setVisibility(0);
        } else {
            textView.setVisibility(8);
            viewFindViewById.setVisibility(0);
        }
    }

    public void resetNewMessageCount() {
        updateMessageBatchCount(0);
    }

    public void updateFaqLoadingUI(int i) {
        this.viewNoFaqs.setVisibility(8);
        this.viewFaqsLoading.setVisibility(8);
        this.viewFaqsLoadError.setVisibility(8);
        if (i == 0) {
            this.viewFaqsLoading.setVisibility(0);
        } else if (i == 2) {
            this.viewNoFaqs.setVisibility(0);
        } else {
            if (i != 3) {
                return;
            }
            this.viewFaqsLoadError.setVisibility(0);
        }
    }

    private void quitSupportFragment() {
        Activity activity = getActivity(this);
        if (activity instanceof ParentActivity) {
            activity.finish();
        } else {
            ((AppCompatActivity) activity).getSupportFragmentManager().beginTransaction().remove(this).commit();
        }
    }

    private void startLiveUpdates() {
        ConversationalFragment conversationalFragment = (ConversationalFragment) getRetainedChildFragmentManager().findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (conversationalFragment != null) {
            conversationalFragment.startLiveUpdates();
        }
    }

    private void stopLiveUpdates() {
        ConversationalFragment conversationalFragment = (ConversationalFragment) getRetainedChildFragmentManager().findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (conversationalFragment != null) {
            conversationalFragment.stopLiveUpdates();
        }
    }

    public void onFocusChanged(boolean z) {
        List<Fragment> fragments = getRetainedChildFragmentManager().getFragments();
        if (fragments != null) {
            for (Fragment fragment : fragments) {
                if (fragment instanceof ConversationalFragment) {
                    ((ConversationalFragment) fragment).onFocusChanged(z);
                }
            }
        }
    }

    public boolean onBackPressed() {
        List<Fragment> fragments = getRetainedChildFragmentManager().getFragments();
        if (fragments != null) {
            Iterator<Fragment> it = fragments.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Fragment next = it.next();
                if (next != null && next.isVisible()) {
                    if ((next instanceof FaqFlowFragment) || (next instanceof BaseConversationFragment)) {
                        FragmentManager childFragmentManager = next.getChildFragmentManager();
                        if (childFragmentManager.getBackStackEntryCount() > 0) {
                            childFragmentManager.popBackStack();
                            return true;
                        }
                        if (next instanceof ConversationalFragment) {
                            ConversationalFragment conversationalFragment = (ConversationalFragment) next;
                            if (conversationalFragment.onBackPressed()) {
                                return true;
                            }
                            conversationalFragment.stopLiveUpdates();
                        }
                    } else if (next instanceof AttachmentPreviewFragment) {
                        ((AttachmentPreviewFragment) next).deleteAttachmentLocalCopy();
                        return false;
                    }
                }
            }
        }
        return false;
    }

    public void setToolbarTitleAndHeader(String str) {
        if (this.isEmbedded) {
            Toolbar toolbar = this.embeddedToolbarView;
            if (toolbar != null) {
                toolbar.setTitle(str);
                return;
            }
            return;
        }
        ActionBar hSActivityActionBar = getHSActivityActionBar();
        if (hSActivityActionBar != null) {
            if (isConversationFragmentVisible()) {
                hSActivityActionBar.setTitle(getHeaderTitle());
                setUpHSToolbarHeader(getView());
            } else {
                removeHSToolbarHeader(getView());
                hSActivityActionBar.setTitle(str);
            }
        }
    }

    public void showToolbarElevation(boolean z) {
        if (Build.VERSION.SDK_INT >= 21) {
            showToolbarElevationLollipop(z);
        } else {
            showToolbarElevationPreLollipop(z);
        }
    }

    private void showToolbarElevationLollipop(boolean z) {
        float fDpToPx = z ? Styles.dpToPx(getContext(), 4.0f) : 0.0f;
        if (this.isEmbedded) {
            Toolbar toolbar = this.embeddedToolbarView;
            if (toolbar != null) {
                toolbar.setElevation(fDpToPx);
                return;
            }
            return;
        }
        ActionBar hSActivityActionBar = getHSActivityActionBar();
        if (hSActivityActionBar != null) {
            hSActivityActionBar.setElevation(fDpToPx);
        }
    }

    private void showToolbarElevationPreLollipop(boolean z) {
        FrameLayout frameLayout = (FrameLayout) getActivity(this).findViewById(R.id.flow_fragment_container);
        if (frameLayout != null) {
            if (z) {
                frameLayout.setForeground(getResources().getDrawable(R.drawable.hs__actionbar_compat_shadow));
            } else {
                frameLayout.setForeground(new ColorDrawable(0));
            }
        }
    }

    @Override // com.helpshift.support.contracts.SupportScreenView
    public void exitSdkSession() {
        if (getActivity() instanceof ParentActivity) {
            getActivity().finish();
        } else {
            FragmentUtil.removeFragment(getActivity().getSupportFragmentManager(), this);
        }
    }

    @Override // com.helpshift.support.contracts.SupportScreenView
    public void launchAttachmentPicker(Bundle bundle) {
        getImagePicker().launchPicker(bundle);
    }

    public void onNewIntent(Bundle bundle) {
        if (this.isForeground) {
            this.supportController.onNewIntent(bundle);
        } else {
            this.newIntentData = bundle;
        }
        this.handleNewIntent = !this.isForeground;
    }

    private void updateMessageBatchCount(Integer num) {
        this.newMessageCount = num.intValue();
        updateBadgeIcon();
    }

    @Override // com.helpshift.util.FetchDataFromThread
    public void onDataFetched(Integer num) {
        updateMessageBatchCount(num);
    }

    public void registerToolbarMenuEventsListener(IMenuItemEventListener iMenuItemEventListener) {
        this.menuItemEventListener = new WeakReference<>(iMenuItemEventListener);
    }

    public void unRegisterToolbarMenuEventsListener(IMenuItemEventListener iMenuItemEventListener) {
        WeakReference<IMenuItemEventListener> weakReference = this.menuItemEventListener;
        if (weakReference == null || weakReference.get() != iMenuItemEventListener) {
            return;
        }
        this.menuItemEventListener = null;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        FaqFlowFragment faqFlowFragment;
        if (view.getId() != R.id.button_retry || (faqFlowFragment = FragmentUtil.getFaqFlowFragment(getRetainedChildFragmentManager())) == null) {
            return;
        }
        faqFlowFragment.retryGetSections();
    }

    private synchronized AttachmentPicker getImagePicker() {
        if (this.imagePicker == null) {
            this.imagePicker = new AttachmentPicker(HelpshiftContext.getApplicationContext(), HelpshiftContext.getPlatform().getDevice(), this, HelpshiftContext.getCoreApi().getSDKConfigurationDM());
        }
        return this.imagePicker;
    }

    /* JADX INFO: renamed from: com.helpshift.support.fragments.SupportFragment$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
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
        }
    }

    @Override // com.helpshift.support.fragments.IToolbarMenuItemRenderer
    public void updateMenuItemVisibility(HSMenuItemType hSMenuItemType, boolean z) {
        MenuItem menuItem;
        int i = AnonymousClass3.$SwitchMap$com$helpshift$support$fragments$HSMenuItemType[hSMenuItemType.ordinal()];
        if (i != 1) {
            if (i == 2 && (menuItem = this.attachImageMenuItem) != null) {
                menuItem.setVisible(z);
                return;
            }
            return;
        }
        MenuItem menuItem2 = this.startNewConversationMenuItem;
        if (menuItem2 != null) {
            menuItem2.setVisible(z);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if ((i == 1 || i == 2) && intent != null && i2 == -1) {
            getImagePicker().onAttachmentPickRequestResult(i, intent);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        List<Fragment> fragments = getRetainedChildFragmentManager().getFragments();
        if (fragments != null) {
            for (Fragment fragment : fragments) {
                if (fragment != null && fragment.isVisible() && (fragment instanceof BaseConversationFragment)) {
                    fragment.onRequestPermissionsResult(i, strArr, iArr);
                    return;
                }
            }
        }
        super.onRequestPermissionsResult(i, strArr, iArr);
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.embeddedToolbarId = arguments.getInt("toolbarId");
            this.isEmbedded = arguments.getBoolean(SupportFragmentConstants.IS_EMBEDDED, false);
        }
        if (this.embeddedToolbarId == 0) {
            setHasOptionsMenu(true);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__support_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.viewNoFaqs = view.findViewById(R.id.view_no_faqs);
        this.viewFaqsLoading = view.findViewById(R.id.view_faqs_loading);
        this.viewFaqsLoadError = view.findViewById(R.id.view_faqs_load_error);
        ((Button) view.findViewById(R.id.button_retry)).setOnClickListener(this);
        if (HelpshiftContext.getCoreApi().getSDKConfigurationDM().isHelpshiftBrandingDisabled()) {
            ((ImageView) view.findViewById(R.id.hs_logo)).setVisibility(8);
        }
        this.bottomSheetContainer = (FrameLayout) view.findViewById(R.id.hs__bottom_sheet_container);
        this.supportUIContainer = (LinearLayout) view.findViewById(R.id.hs__support_ui_parent_container);
        if (this.isEmbedded) {
            setupEmbeddedToolbarView();
        } else {
            setupHSToolbarView(view);
        }
    }

    private void setupHSToolbarView(View view) {
        if (this.isEmbedded) {
            return;
        }
        Toolbar toolbar = (Toolbar) view.findViewById(R.id.hs__toolbar);
        this.hsToolbarView = toolbar;
        toolbar.setVisibility(0);
        ParentActivity hSSupportActivity = getHSSupportActivity();
        if (hSSupportActivity != null) {
            hSSupportActivity.setSupportActionBar(this.hsToolbarView);
            ActionBar supportActionBar = hSSupportActivity.getSupportActionBar();
            if (supportActionBar != null) {
                supportActionBar.setDisplayHomeAsUpEnabled(true);
            }
        }
    }

    private boolean isConversationFragmentVisible() {
        ConversationalFragment conversationalFragment = (ConversationalFragment) this.supportController.getFragmentManager().findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (conversationalFragment != null) {
            return conversationalFragment.isResumed();
        }
        return false;
    }

    private String getHeaderTitle() {
        SDKConfigurationDM sDKConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
        return StringUtils.isEmpty(sDKConfigurationDM.getCustomHeaderTitle()) ? getResources().getString(R.string.hs__conversation_header) : sDKConfigurationDM.getCustomHeaderTitle();
    }

    public void setUpHSToolbarHeader(View view) {
        SDKConfigurationDM sDKConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
        View viewFindViewById = view.findViewById(R.id.custom_header_layout);
        if (isConversationFragmentVisible() && view != null) {
            ((HSTextView) view.findViewById(R.id.hs__header_title)).setText(getHeaderTitle());
            if (sDKConfigurationDM.isConversationHeaderEnabled()) {
                AvatarImageLoader.loadConversationHeaderAvatarImage(HelpshiftContext.getApplicationContext(), (CircleImageView) view.findViewById(R.id.hs__header_avatar_image), sDKConfigurationDM.getConversationHeaderImageLocalPath());
                viewFindViewById.setVisibility(0);
                return;
            }
            viewFindViewById.setVisibility(8);
            return;
        }
        viewFindViewById.setVisibility(8);
    }

    void removeHSToolbarHeader(View view) {
        View viewFindViewById;
        if (view == null || (viewFindViewById = view.findViewById(R.id.custom_header_layout)) == null) {
            return;
        }
        viewFindViewById.setVisibility(8);
    }

    private void setupEmbeddedToolbarView() {
        int i;
        if (this.isEmbedded && (i = this.embeddedToolbarId) != 0) {
            Toolbar toolbarFindToolbarViewInViewHierarchy = findToolbarViewInViewHierarchy(i);
            this.embeddedToolbarView = toolbarFindToolbarViewInViewHierarchy;
            if (toolbarFindToolbarViewInViewHierarchy == null) {
                HSLogger.e(TAG, "Unable to retrieve toolbarView from dev provided toolbarId via ApiConfig");
                return;
            }
            Menu menu = toolbarFindToolbarViewInViewHierarchy.getMenu();
            ArrayList arrayList = new ArrayList();
            for (int i2 = 0; i2 < menu.size(); i2++) {
                arrayList.add(Integer.valueOf(menu.getItem(i2).getItemId()));
            }
            this.embeddedToolbarView.inflateMenu(getMenuResourceId());
            attachMenuListeners(this.embeddedToolbarView.getMenu());
            Menu menu2 = this.embeddedToolbarView.getMenu();
            this.fragmentMenuItems = new ArrayList();
            for (int i3 = 0; i3 < menu2.size(); i3++) {
                int itemId = menu2.getItem(i3).getItemId();
                if (!arrayList.contains(Integer.valueOf(itemId))) {
                    this.fragmentMenuItems.add(Integer.valueOf(itemId));
                }
            }
        }
    }

    private ActionBar getHSActivityActionBar() {
        ParentActivity hSSupportActivity = getHSSupportActivity();
        if (hSSupportActivity != null) {
            return hSSupportActivity.getSupportActionBar();
        }
        return null;
    }

    private ParentActivity getHSSupportActivity() {
        FragmentActivity activity = getActivity();
        if (activity instanceof ParentActivity) {
            return (ParentActivity) activity;
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x001d, code lost:
    
        return false;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean isParentViewBottomSheetDialogFragment() {
        /*
            r4 = this;
            boolean r0 = r4.isEmbedded
            r1 = 0
            if (r0 != 0) goto L6
            return r1
        L6:
            androidx.fragment.app.Fragment r0 = r4.getParentFragment()
            r2 = 5
        Lb:
            int r3 = r2 + (-1)
            if (r2 <= 0) goto L1d
            if (r0 == 0) goto L1d
            boolean r2 = r0 instanceof com.google.android.material.bottomsheet.BottomSheetDialogFragment
            if (r2 == 0) goto L17
            r0 = 1
            return r0
        L17:
            androidx.fragment.app.Fragment r0 = r0.getParentFragment()
            r2 = r3
            goto Lb
        L1d:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.fragments.SupportFragment.isParentViewBottomSheetDialogFragment():boolean");
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0031, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private androidx.appcompat.widget.Toolbar findToolbarViewInViewHierarchy(int r5) {
        /*
            r4 = this;
            r0 = 0
            if (r5 != 0) goto L4
            return r0
        L4:
            android.app.Activity r1 = r4.getActivity(r4)
            android.view.View r1 = r1.findViewById(r5)
            androidx.appcompat.widget.Toolbar r1 = (androidx.appcompat.widget.Toolbar) r1
            if (r1 == 0) goto L11
            return r1
        L11:
            androidx.fragment.app.Fragment r1 = r4.getParentFragment()
            r2 = 5
        L16:
            int r3 = r2 + (-1)
            if (r2 <= 0) goto L31
            if (r1 == 0) goto L31
            android.view.View r2 = r1.getView()
            if (r2 == 0) goto L2b
            android.view.View r2 = r2.findViewById(r5)
            androidx.appcompat.widget.Toolbar r2 = (androidx.appcompat.widget.Toolbar) r2
            if (r2 == 0) goto L2b
            return r2
        L2b:
            androidx.fragment.app.Fragment r1 = r1.getParentFragment()
            r2 = r3
            goto L16
        L31:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.fragments.SupportFragment.findToolbarViewInViewHierarchy(int):androidx.appcompat.widget.Toolbar");
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewStateRestored(Bundle bundle) {
        super.onViewStateRestored(bundle);
        if (bundle != null) {
            SupportController supportController = this.supportController;
            if (supportController != null) {
                supportController.onViewStateRestored(bundle);
            }
            getImagePicker().onViewStateRestored(bundle);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.supportController.start();
        setToolbarTitle(getString(R.string.hs__help_header));
        showToolbarElevation(true);
        HelpshiftContext.getCoreApi().getConversationController().fetchConversationUpdatesListenerReference = new AtomicReference<>(this);
        startLiveUpdates();
        updateMessageBatchCount(Integer.valueOf(HelpshiftContext.getCoreApi().getNotificationCountSync()));
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        SupportController supportController = this.supportController;
        if (supportController != null) {
            supportController.onSaveInstanceState(bundle);
        }
        getImagePicker().onSaveInstanceState(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        SnackbarUtil.hideSnackbar(getView());
        Toolbar toolbar = this.embeddedToolbarView;
        if (toolbar != null && this.fragmentMenuItems != null) {
            Menu menu = toolbar.getMenu();
            Iterator<Integer> it = this.fragmentMenuItems.iterator();
            while (it.hasNext()) {
                menu.removeItem(it.next().intValue());
            }
        }
        this.viewFaqsLoadError = null;
        this.viewFaqsLoading = null;
        this.viewNoFaqs = null;
        super.onDestroyView();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        if (this.isNoOpMode) {
            super.onDetach();
            return;
        }
        HelpshiftContext.getPlatform().setUIContext(null);
        LocaleContextUtil.restoreApplicationLocale();
        if (!isChangingConfigurations()) {
            HelpshiftContext.getCoreApi().getConversationInboxPoller().startAppPoller(true);
        }
        super.onDetach();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(getMenuResourceId(), menu);
        attachMenuListeners(menu);
        WeakReference<IMenuItemEventListener> weakReference = this.menuItemEventListener;
        if (weakReference != null && weakReference.get() != null) {
            this.menuItemEventListener.get().onCreateOptionMenuCalled();
        }
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    @Override // com.helpshift.support.widget.AttachmentPicker.AttachmentPickerListener
    public void askForReadStoragePermission() {
        BaseConversationFragment baseConversationFragment = (BaseConversationFragment) getRetainedChildFragmentManager().findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (baseConversationFragment == null) {
            baseConversationFragment = (BaseConversationFragment) getRetainedChildFragmentManager().findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        }
        if (baseConversationFragment != null) {
            baseConversationFragment.requestPermission(true, 2);
        }
    }

    @Override // com.helpshift.support.widget.AttachmentPicker.AttachmentPickerListener
    public void onAttachmentPickerResultSuccess(AttachmentPickerFile attachmentPickerFile, Bundle bundle) {
        getSupportController().startScreenshotPreviewFragment(attachmentPickerFile, bundle, AttachmentPreviewFragment.LaunchSource.GALLERY_APP);
    }

    @Override // com.helpshift.support.widget.AttachmentPicker.AttachmentPickerListener
    public void onAttachmentPickerResultFailure(int i, Long l) {
        if (i == -5) {
            SnackbarUtil.showSnackbar(getView(), R.string.hs__screenshot_upload_error_msg, 0);
            return;
        }
        if (i == -4) {
            SnackbarUtil.showSnackbar(getView(), R.string.hs__network_error_msg, 0);
            return;
        }
        if (i == -3) {
            SnackbarUtil.showSnackbar(getView(), String.format(getResources().getString(R.string.hs__screenshot_limit_error), Float.valueOf(l.longValue() / 1048576.0f)), 0);
        } else if (i == -2) {
            SnackbarUtil.showSnackbar(getView(), R.string.hs__file_type_unsupported, 0);
        } else {
            if (i != -1) {
                return;
            }
            SnackbarUtil.showSnackbar(getView(), R.string.hs__screenshot_cloud_attach_error, 0);
        }
    }

    public void setToolbarImportanceForAccessibility(int i) {
        if (Build.VERSION.SDK_INT < 19) {
            return;
        }
        if (this.isEmbedded) {
            Toolbar toolbar = this.embeddedToolbarView;
            if (toolbar != null) {
                this.embeddedToolbarViewImportanceForAccessibility = toolbar.getImportantForAccessibility();
                this.embeddedToolbarView.setImportantForAccessibility(i);
                return;
            }
            return;
        }
        Toolbar toolbar2 = this.hsToolbarView;
        if (toolbar2 != null) {
            toolbar2.setImportantForAccessibility(i);
        }
    }

    public void resetToolbarImportanceForAccessibility() {
        if (Build.VERSION.SDK_INT < 19) {
            return;
        }
        if (this.isEmbedded) {
            Toolbar toolbar = this.embeddedToolbarView;
            if (toolbar != null) {
                toolbar.setImportantForAccessibility(this.embeddedToolbarViewImportanceForAccessibility);
                return;
            }
            return;
        }
        Toolbar toolbar2 = this.hsToolbarView;
        if (toolbar2 != null) {
            toolbar2.setImportantForAccessibility(0);
        }
    }

    public void showBottomSheetViewContainer(View view, int i) {
        if (view == null || i < 0) {
            HSLogger.d(TAG, "showBottomSheetViewContainer called with invalid data");
            return;
        }
        HSLogger.d(TAG, "showBottomSheetViewContainer called");
        this.bottomSheetContainer.removeAllViews();
        this.bottomSheetContainer.addView(view);
        this.bottomSheetContainer.setVisibility(0);
        animateViewBottomMarginChange(this.supportUIContainer, i, 300);
    }

    public void hideBottomSheetViewContainer() {
        if (this.bottomSheetContainer.getVisibility() == 8) {
            return;
        }
        HSLogger.d(TAG, "hideBottomSheetViewContainer called");
        this.bottomSheetContainer.removeAllViews();
        this.bottomSheetContainer.setVisibility(8);
        animateViewBottomMarginChange(this.supportUIContainer, 0, 300);
    }

    private void animateViewBottomMarginChange(final View view, final int i, int i2) {
        Animation animation = new Animation() { // from class: com.helpshift.support.fragments.SupportFragment.2
            @Override // android.view.animation.Animation
            protected void applyTransformation(float f, Transformation transformation) {
                CoordinatorLayout.LayoutParams layoutParams = (CoordinatorLayout.LayoutParams) view.getLayoutParams();
                layoutParams.bottomMargin = (int) (i * f);
                SupportFragment.this.supportUIContainer.setLayoutParams(layoutParams);
            }
        };
        animation.setDuration(i2);
        this.supportUIContainer.startAnimation(animation);
    }
}

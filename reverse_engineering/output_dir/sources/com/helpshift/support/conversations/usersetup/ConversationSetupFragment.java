package com.helpshift.support.conversations.usersetup;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import com.helpshift.R;
import com.helpshift.common.domain.Domain;
import com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer;
import com.helpshift.conversation.viewmodel.ConversationSetupVM;
import com.helpshift.network.connectivity.HSConnectivityManager;
import com.helpshift.network.connectivity.HSNetworkConnectivityCallback;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.fragments.MainFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.util.Styles;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.HSObserver;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationSetupFragment extends MainFragment implements ConversationSetupRenderer, HSNetworkConnectivityCallback {
    public static final String FRAGMENT_TAG = "Helpshift_CnvStpFrgmnt";
    private ConversationSetupVM conversationSetupVM;
    private View offlineErrorView;
    private ProgressBar progressBar;
    private View progressDescriptionView;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static ConversationSetupFragment newInstance() {
        return new ConversationSetupFragment();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__user_setup_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        initialize(view);
        super.onViewCreated(view, bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        addViewStateObservers();
        setToolbarTitle(getString(R.string.hs__conversation_header));
        HSConnectivityManager.getInstance(HelpshiftContext.getApplicationContext()).registerNetworkConnectivityListener(this);
        this.conversationSetupVM.onResume();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.conversationSetupVM.onDestroyView();
        super.onDestroyView();
    }

    private void addViewStateObservers() {
        Domain domain = HelpshiftContext.getCoreApi().getDomain();
        this.conversationSetupVM.getProgressBarViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.usersetup.ConversationSetupFragment.1
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                if (((BaseViewState) obj).isVisible()) {
                    ConversationSetupFragment.this.showProgressBar();
                } else {
                    ConversationSetupFragment.this.hideProgressBar();
                }
            }
        });
        this.conversationSetupVM.getDescriptionProgressViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.usersetup.ConversationSetupFragment.2
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                if (((BaseViewState) obj).isVisible()) {
                    ConversationSetupFragment.this.showProgressDescription();
                } else {
                    ConversationSetupFragment.this.hideProgressDescription();
                }
            }
        });
        this.conversationSetupVM.getUserOfflineErrorViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.usersetup.ConversationSetupFragment.3
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                if (((BaseViewState) obj).isVisible()) {
                    ConversationSetupFragment.this.showNoInternetView();
                } else {
                    ConversationSetupFragment.this.hideNoInternetView();
                }
            }
        });
    }

    private void removeViewStateObservers() {
        this.conversationSetupVM.getProgressBarViewState().unsubscribe();
        this.conversationSetupVM.getDescriptionProgressViewState().unsubscribe();
        this.conversationSetupVM.getUserOfflineErrorViewState().unsubscribe();
    }

    private void initialize(View view) {
        this.progressBar = (ProgressBar) view.findViewById(R.id.progressbar);
        Styles.setAccentColor(getContext(), this.progressBar.getIndeterminateDrawable());
        this.progressDescriptionView = view.findViewById(R.id.progress_description_text_view);
        this.offlineErrorView = view.findViewById(R.id.offline_error_view);
        com.helpshift.util.Styles.setColorFilter(getContext(), ((ImageView) view.findViewById(R.id.info_icon)).getDrawable(), android.R.attr.textColorPrimary);
        this.conversationSetupVM = HelpshiftContext.getCoreApi().getConversationSetupVM(this);
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onPause() {
        removeViewStateObservers();
        HSConnectivityManager.getInstance(HelpshiftContext.getApplicationContext()).unregisterNetworkConnectivityListener(this);
        super.onPause();
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void showNoInternetView() {
        this.offlineErrorView.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void hideNoInternetView() {
        this.offlineErrorView.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void showProgressBar() {
        this.progressBar.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void hideProgressBar() {
        this.progressBar.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void showProgressDescription() {
        this.progressDescriptionView.setVisibility(0);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void hideProgressDescription() {
        this.progressDescriptionView.setVisibility(8);
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void onConversationSetupComplete() {
        getSupportController().onConversationSetupCompleted();
    }

    @Override // com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer
    public void onAuthenticationFailure() {
        getSupportController().onAuthenticationFailure();
    }

    private SupportController getSupportController() {
        return ((SupportFragment) getParentFragment()).getSupportController();
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkAvailable() {
        this.conversationSetupVM.onNetworkAvailable();
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkUnavailable() {
        this.conversationSetupVM.onNetworkUnavailable();
    }
}

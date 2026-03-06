package com.helpshift.campaigns.fragments;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.TextView;
import com.helpshift.R;
import com.helpshift.campaigns.interactors.CampaignDetailInteractor;
import com.helpshift.campaigns.observers.CampaignDetailPresenterObserver;
import com.helpshift.campaigns.presenters.CampaignDetailPresenter;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.util.FragmentUtil;
import com.helpshift.campaigns.views.AdjustableImageView;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.views.HSSnackbar;
import com.ironsource.sdk.constants.Constants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDetailFragment extends MainFragment implements CampaignDetailPresenterObserver {
    private static final String TAG = "Helpshift_CampDetails";
    private List<Button> actionButtons;
    private TextView bodyTextView;
    private ScrollView campaignDetailViewContainer;
    private String campaignId;
    private ProgressBar coverImageProgressbar;
    private AdjustableImageView coverImageView;
    private LinearLayout expiredMessageView;
    private ViewStub expiredMessageViewStub;
    CampaignDetailPresenter presenter;
    private ProgressBar progressBar;
    private TextView titleTextView;

    public static CampaignDetailFragment newInstance(Bundle bundle) {
        CampaignDetailFragment campaignDetailFragment = new CampaignDetailFragment();
        campaignDetailFragment.setArguments(bundle);
        return campaignDetailFragment;
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.campaignId = getArguments().getString(Constants.RequestParameters.CAMPAIGN_ID);
        CampaignDetailInteractor campaignDetailInteractorNewInstance = CampaignDetailInteractor.newInstance(this.campaignId, CampaignsStorageFactory.getInstance().campaignStorage, CampaignsStorageFactory.getInstance().campaignSyncModelStorage);
        if (campaignDetailInteractorNewInstance != null) {
            this.presenter = new CampaignDetailPresenter(campaignDetailInteractorNewInstance);
        }
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.coverImageView = (AdjustableImageView) view.findViewById(R.id.campaign_cover_image);
        this.coverImageProgressbar = (ProgressBar) view.findViewById(R.id.campaign_cover_image_progress);
        this.titleTextView = (TextView) view.findViewById(R.id.campaign_title);
        this.bodyTextView = (TextView) view.findViewById(R.id.campaign_body);
        ArrayList arrayList = new ArrayList();
        this.actionButtons = arrayList;
        arrayList.add((Button) view.findViewById(R.id.action1_button));
        this.actionButtons.add((Button) view.findViewById(R.id.action2_button));
        this.actionButtons.add((Button) view.findViewById(R.id.action3_button));
        this.actionButtons.add((Button) view.findViewById(R.id.action4_button));
        this.progressBar = (ProgressBar) view.findViewById(R.id.progress_bar);
        this.campaignDetailViewContainer = (ScrollView) view.findViewById(R.id.campaign_detail_view_container);
        this.expiredMessageViewStub = (ViewStub) view.findViewById(R.id.hs__campaign_expired_view_stub);
        HSLogger.d(TAG, "Showing Campaign details");
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        InboxFragment inboxFragment;
        super.onStop();
        if (isChangingConfigurations() || isDualPane() || (inboxFragment = FragmentUtil.getInboxFragment(this)) == null) {
            return;
        }
        inboxFragment.setShowDetailFragment(false);
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment
    protected boolean shouldRetainInstance() {
        return !isTablet();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        CampaignDetailPresenter campaignDetailPresenter = this.presenter;
        if (campaignDetailPresenter != null) {
            campaignDetailPresenter.setUp();
            this.presenter.addObserver(this);
        }
        return layoutInflater.inflate(R.layout.hs__campaign_detail_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__cam_message));
        invalidateUiElements();
        CampaignDetailPresenter campaignDetailPresenter = this.presenter;
        if (campaignDetailPresenter != null) {
            campaignDetailPresenter.markCampaignAsSeen();
            ApplicationUtil.cancelNotification(getContext(), this.campaignId);
            HSLogger.d(TAG, "Campaign title : " + this.presenter.getTitle());
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        CampaignDetailPresenter campaignDetailPresenter = this.presenter;
        if (campaignDetailPresenter != null) {
            campaignDetailPresenter.cleanUp();
            this.presenter.removeObserver(this);
        }
    }

    void invalidateUiElements() {
        if (this.presenter != null) {
            View view = getView();
            if (this.presenter.isExpired()) {
                if (this.expiredMessageView == null) {
                    this.expiredMessageView = (LinearLayout) this.expiredMessageViewStub.inflate();
                }
                this.expiredMessageView.setVisibility(0);
                this.campaignDetailViewContainer.setVisibility(8);
                if (view != null) {
                    view.setBackgroundColor(0);
                    return;
                }
                return;
            }
            LinearLayout linearLayout = this.expiredMessageView;
            if (linearLayout != null) {
                linearLayout.setVisibility(8);
            }
            this.campaignDetailViewContainer.setVisibility(0);
            if (TextUtils.isEmpty(this.presenter.getTitle())) {
                this.progressBar.setVisibility(0);
            } else {
                this.progressBar.setVisibility(8);
            }
            HashMap<String, Object> coverImage = this.presenter.getCoverImage();
            Bitmap bitmap = (Bitmap) coverImage.get("bitmap");
            if (bitmap != null) {
                this.coverImageView.setImageBitmap(bitmap);
                if (coverImage.containsKey("default")) {
                    this.coverImageProgressbar.setVisibility(0);
                } else {
                    this.coverImageProgressbar.setVisibility(8);
                }
            }
            this.titleTextView.setText(this.presenter.getTitle());
            if (!TextUtils.isEmpty(this.presenter.getTitleColor())) {
                try {
                    this.titleTextView.setTextColor(Color.parseColor(this.presenter.getTitleColor()));
                } catch (IllegalArgumentException e) {
                    HSLogger.d(TAG, "Error while parsing title color", e);
                }
            }
            this.bodyTextView.setText(this.presenter.getBody());
            if (!TextUtils.isEmpty(this.presenter.getTextColor())) {
                try {
                    this.bodyTextView.setTextColor(Color.parseColor(this.presenter.getTextColor()));
                } catch (IllegalArgumentException e2) {
                    HSLogger.d(TAG, "Error while parsing body color", e2);
                }
            }
            if (view != null && !TextUtils.isEmpty(this.presenter.getBackgroundColor())) {
                try {
                    view.setBackgroundColor(Color.parseColor(this.presenter.getBackgroundColor()));
                } catch (IllegalArgumentException e3) {
                    HSLogger.d(TAG, "Error while parsing background color", e3);
                }
            }
            for (final int i = 0; i < this.presenter.getCountOfActions(); i++) {
                Button button = this.actionButtons.get(i);
                button.setText(this.presenter.getActionTitle(i));
                button.setTextColor(Color.parseColor(this.presenter.getActionTitleColor(i)));
                button.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.campaigns.fragments.CampaignDetailFragment.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view2) {
                        CampaignDetailFragment.this.presenter.buttonClicked(i, CampaignDetailFragment.this.getActivity());
                    }
                });
                button.setVisibility(0);
            }
            return;
        }
        HSSnackbar.make(getView(), R.string.hs__data_not_found_msg, 0).show();
    }

    @Override // com.helpshift.campaigns.observers.CampaignDetailPresenterObserver
    public void dataChanged() {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.helpshift.campaigns.fragments.CampaignDetailFragment.2
            @Override // java.lang.Runnable
            public void run() {
                CampaignDetailFragment.this.invalidateUiElements();
            }
        });
    }
}

package com.helpshift.support.fragments;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.util.Log;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.helpshift.R;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.Styles;
import com.helpshift.util.ActivityUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.LocaleContextUtil;
import com.helpshift.views.HSToast;
import java.lang.reflect.Field;

/* JADX INFO: loaded from: classes2.dex */
public abstract class MainFragment extends Fragment {
    private static final String TAG = SupportFragment.class.getSimpleName();
    public static final String TOOLBAR_ID = "toolbarId";
    private static boolean shouldRetainChildFragmentManager;
    protected String fragmentName = getClass().getName();
    private boolean isChangingConfigurations;
    private boolean isScreenLarge;
    private FragmentManager retainedChildFragmentManager;

    public abstract boolean shouldRefreshMenu();

    public FragmentManager getRetainedChildFragmentManager() {
        if (shouldRetainChildFragmentManager) {
            if (this.retainedChildFragmentManager == null) {
                this.retainedChildFragmentManager = getChildFragmentManager();
            }
            return this.retainedChildFragmentManager;
        }
        return getChildFragmentManager();
    }

    public boolean isChangingConfigurations() {
        return this.isChangingConfigurations;
    }

    @Override // androidx.fragment.app.Fragment
    public Context getContext() {
        Context context = super.getContext();
        return context != null ? context : HelpshiftContext.getApplicationContext();
    }

    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(LocaleContextUtil.getContextWithUpdatedLocaleLegacy(context));
            try {
                setRetainInstance(true);
            } catch (Exception unused) {
                shouldRetainChildFragmentManager = true;
            }
            if (HelpshiftContext.getApplicationContext() == null) {
                HelpshiftContext.setApplicationContext(context.getApplicationContext());
            }
            this.isScreenLarge = Styles.isTablet(getContext());
            if (!shouldRetainChildFragmentManager || this.retainedChildFragmentManager == null) {
                return;
            }
            try {
                Field declaredField = Fragment.class.getDeclaredField("mChildFragmentManager");
                declaredField.setAccessible(true);
                declaredField.set(this, this.retainedChildFragmentManager);
            } catch (IllegalAccessException e) {
                HSLogger.d(TAG, "IllegalAccessException", e);
            } catch (NoSuchFieldException e2) {
                HSLogger.d(TAG, "NoSuchFieldException", e2);
            }
        } catch (Exception e3) {
            Log.e(TAG, "Caught exception in MainFragment.onAttach()", e3);
            super.onAttach(context);
            if (!HelpshiftContext.installCallSuccessful.get()) {
                ActivityUtil.startLauncherActivityAndFinish(getActivity());
            }
            throw e3;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public Animation onCreateAnimation(int i, boolean z, int i2) {
        if (!InfoModelFactory.getInstance().appInfoModel.disableAnimations.booleanValue() && !z && !isRemoving()) {
            AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 1.0f);
            alphaAnimation.setDuration(getResources().getInteger(R.integer.hs_animation_duration));
            return alphaAnimation;
        }
        return super.onCreateAnimation(i, z, i2);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        SupportFragment supportFragment;
        super.onStart();
        if (!shouldRefreshMenu() || (supportFragment = FragmentUtil.getSupportFragment(this)) == null) {
            return;
        }
        supportFragment.addVisibleFragment(this.fragmentName);
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        this.isChangingConfigurations = getActivity(this).isChangingConfigurations();
        super.onPause();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        SupportFragment supportFragment;
        if (shouldRefreshMenu() && (supportFragment = FragmentUtil.getSupportFragment(this)) != null) {
            supportFragment.removeVisibleFragment(this.fragmentName);
        }
        super.onStop();
    }

    public Activity getActivity(Fragment fragment) {
        if (fragment == null) {
            return null;
        }
        while (fragment.getParentFragment() != null) {
            fragment = fragment.getParentFragment();
        }
        return fragment.getActivity();
    }

    public boolean isScreenLarge() {
        return this.isScreenLarge;
    }

    public void setToolbarTitle(String str) {
        SupportFragment supportFragment = FragmentUtil.getSupportFragment(this);
        if (supportFragment != null) {
            supportFragment.setToolbarTitleAndHeader(str);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void copyToClipboard(String str) {
        ((ClipboardManager) getContext().getSystemService("clipboard")).setPrimaryClip(ClipData.newPlainText("Copy Text", str));
        HSToast.makeText(getContext(), getString(R.string.hs__copied_to_clipboard), 0).show();
    }
}

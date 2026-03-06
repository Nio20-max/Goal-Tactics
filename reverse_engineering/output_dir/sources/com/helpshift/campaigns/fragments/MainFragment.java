package com.helpshift.campaigns.fragments;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.helpshift.R;
import com.helpshift.campaigns.util.FragmentUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.LocaleContextUtil;
import com.helpshift.util.Styles;
import java.lang.reflect.Field;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public abstract class MainFragment extends Fragment {
    public static final String TOOLBAR_ID = "toolbarId";
    private static boolean shouldRetainChildFragmentManager;
    private boolean isChangingConfigurations;
    private boolean isDualPane;
    private FragmentManager retainedChildFragmentManager;
    private int toolbarId = 0;
    private Toolbar toolbar = null;

    protected void attachMenuListeners(Menu menu) {
    }

    protected int getMenuResourceId() {
        return 0;
    }

    protected boolean shouldRetainInstance() {
        return true;
    }

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
        super.onAttach(LocaleContextUtil.getContextWithUpdatedLocaleLegacy(context));
        if (shouldRetainInstance()) {
            try {
                setRetainInstance(true);
            } catch (Exception unused) {
                shouldRetainChildFragmentManager = true;
            }
        }
        if (HelpshiftContext.getApplicationContext() == null) {
            HelpshiftContext.setApplicationContext(context.getApplicationContext());
        }
        this.isDualPane = getResources().getBoolean(R.bool.is_dual_pane);
        if (!shouldRetainChildFragmentManager || this.retainedChildFragmentManager == null) {
            return;
        }
        try {
            Field declaredField = Fragment.class.getDeclaredField("mChildFragmentManager");
            declaredField.setAccessible(true);
            declaredField.set(this, this.retainedChildFragmentManager);
        } catch (IllegalAccessException e) {
            HSLogger.d("MainFragment", "IllegalAccessException", e);
        } catch (NoSuchFieldException e2) {
            HSLogger.d("MainFragment", "NoSuchFieldException", e2);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.toolbarId = arguments.getInt("toolbarId");
        }
        if (this.toolbarId != 0 || getMenuResourceId() == 0) {
            return;
        }
        setHasOptionsMenu(true);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (this.toolbarId == 0 || getMenuResourceId() == 0) {
            return;
        }
        Toolbar toolbar = (Toolbar) getActivity().findViewById(this.toolbarId);
        this.toolbar = toolbar;
        Menu menu = toolbar.getMenu();
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < menu.size(); i++) {
            arrayList.add(Integer.valueOf(menu.getItem(i).getItemId()));
        }
        this.toolbar.inflateMenu(getMenuResourceId());
        attachMenuListeners(this.toolbar.getMenu());
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        this.isChangingConfigurations = getActivity(this).isChangingConfigurations();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        LocaleContextUtil.restoreApplicationLocale();
        super.onDetach();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        menuInflater.inflate(getMenuResourceId(), menu);
        attachMenuListeners(menu);
        super.onCreateOptionsMenu(menu, menuInflater);
    }

    protected boolean isTablet() {
        return getResources().getBoolean(R.bool.is_screen_large);
    }

    protected Bundle getBundle() {
        Bundle bundle = new Bundle();
        int i = this.toolbarId;
        if (i != 0) {
            bundle.putInt("toolbarId", i);
        }
        return bundle;
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

    public boolean isDualPane() {
        return this.isDualPane && isTablet();
    }

    public void setToolbarTitle(String str) {
        if (this instanceof InboxFragment) {
            ((InboxFragment) this).setTitle(str);
            return;
        }
        InboxFragment inboxFragment = FragmentUtil.getInboxFragment(this);
        if (inboxFragment != null) {
            inboxFragment.setTitle(str);
        }
    }

    public void showToolbarElevation(boolean z) {
        if (Build.VERSION.SDK_INT >= 21) {
            showToolbarElevationLollipop(z);
        }
    }

    private void showToolbarElevationLollipop(boolean z) {
        Toolbar toolbar = this.toolbar;
        if (toolbar != null) {
            if (z) {
                toolbar.setElevation(Styles.dpToPx(getContext(), 4.0f));
                return;
            } else {
                toolbar.setElevation(0.0f);
                return;
            }
        }
        ActionBar supportActionBar = ((AppCompatActivity) getActivity(this)).getSupportActionBar();
        if (supportActionBar != null) {
            if (z) {
                supportActionBar.setElevation(Styles.dpToPx(getContext(), 4.0f));
            } else {
                supportActionBar.setElevation(0.0f);
            }
        }
    }
}

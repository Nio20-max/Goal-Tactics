package com.helpshift.support.conversations;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.helpshift.R;
import com.helpshift.support.fragments.MainFragment;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class AuthenticationFailureFragment extends MainFragment {
    public static final String FRAGMENT_TAG = "HSAuthenticationFailureFragment";

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static AuthenticationFailureFragment newInstance() {
        return new AuthenticationFailureFragment();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__authentication_failure_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        Styles.setColorFilter(getContext(), ((ImageView) view.findViewById(R.id.info_icon)).getDrawable(), android.R.attr.textColorPrimary);
        super.onViewCreated(view, bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__conversation_header));
    }
}

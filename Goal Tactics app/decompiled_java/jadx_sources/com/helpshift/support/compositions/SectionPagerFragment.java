package com.helpshift.support.compositions;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.viewpager.widget.ViewPager;
import com.google.android.material.tabs.TabLayout;
import com.helpshift.R;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.Section;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.fragments.MainFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.util.Styles;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SectionPagerFragment extends MainFragment implements FaqFlowViewParent {
    private TabLayout tabLayout;
    private int tabLayoutPadding = 0;
    private FrameLayout viewPagerContainer;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static SectionPagerFragment newInstance(Bundle bundle) {
        SectionPagerFragment sectionPagerFragment = new SectionPagerFragment();
        sectionPagerFragment.setArguments(bundle);
        return sectionPagerFragment;
    }

    @Override // com.helpshift.support.contracts.FaqFlowViewParent
    public FaqFragmentListener getFaqFlowListener() {
        return ((FaqFlowViewParent) getParentFragment()).getFaqFlowListener();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__section_pager_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        ArrayList parcelableArrayList = getArguments().getParcelableArrayList("sections");
        ViewPager viewPager = (ViewPager) view.findViewById(R.id.section_pager);
        viewPager.setAdapter(new SectionPagerAdapter(getChildFragmentManager(), parcelableArrayList, (FaqTagFilter) getArguments().getSerializable("withTagsMatching")));
        TabLayout tabLayout = (TabLayout) view.findViewById(R.id.pager_tabs);
        this.tabLayout = tabLayout;
        View childAt = tabLayout.getChildAt(0);
        int i = this.tabLayoutPadding;
        childAt.setPadding(i, 0, i, 0);
        this.tabLayout.setupWithViewPager(viewPager);
        viewPager.setCurrentItem(getSectionPosition(parcelableArrayList, getArguments().getString("sectionPublishId")));
        this.viewPagerContainer = (FrameLayout) view.findViewById(R.id.view_pager_container);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        showToolbarElevation(false);
        showTabLayoutElevation();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.tabLayoutPadding = (int) Styles.dpToPx(context, 48.0f);
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        showToolbarElevation(true);
        super.onStop();
    }

    private int getSectionPosition(List<Section> list, String str) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getPublishId().equals(str)) {
                return i;
            }
        }
        return 0;
    }

    private void showToolbarElevation(boolean z) {
        SupportFragment supportFragment = FragmentUtil.getSupportFragment(this);
        if (supportFragment != null) {
            supportFragment.showToolbarElevation(z);
        }
    }

    private void showTabLayoutElevation() {
        if (Build.VERSION.SDK_INT >= 21) {
            this.tabLayout.setElevation(Styles.dpToPx(getContext(), 4.0f));
        } else {
            this.viewPagerContainer.setForeground(getResources().getDrawable(R.drawable.hs__actionbar_compat_shadow));
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.tabLayout = null;
        this.viewPagerContainer = null;
        super.onDestroyView();
    }
}

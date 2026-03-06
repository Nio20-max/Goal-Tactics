package com.helpshift.support.fragments;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.adapters.SectionListAdapter;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class SectionListFragment extends MainFragment {
    private static final String TAG = "Helpshift_SecLstFrag";
    private RecyclerView sectionList;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return false;
    }

    public static SectionListFragment newInstance(Bundle bundle) {
        SectionListFragment sectionListFragment = new SectionListFragment();
        sectionListFragment.setArguments(bundle);
        return sectionListFragment;
    }

    public FaqFragmentListener getFaqFlowListener() {
        return ((FaqFlowViewParent) getParentFragment()).getFaqFlowListener();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in SectionListFragment.onAttach()", e);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__section_list_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        final ArrayList parcelableArrayList = getArguments().getParcelableArrayList("sections");
        final FaqTagFilter faqTagFilter = (FaqTagFilter) getArguments().getSerializable("withTagsMatching");
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.section_list);
        this.sectionList = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        this.sectionList.setAdapter(new SectionListAdapter(parcelableArrayList, new View.OnClickListener() { // from class: com.helpshift.support.fragments.SectionListFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                String str = (String) view2.getTag();
                Bundle bundle2 = new Bundle();
                bundle2.putParcelableArrayList("sections", parcelableArrayList);
                bundle2.putString("sectionPublishId", str);
                bundle2.putSerializable("withTagsMatching", faqTagFilter);
                SectionListFragment.this.getFaqFlowListener().onSectionSelected(bundle2);
            }
        }));
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.sectionList.setAdapter(null);
        this.sectionList = null;
        super.onDestroyView();
    }
}

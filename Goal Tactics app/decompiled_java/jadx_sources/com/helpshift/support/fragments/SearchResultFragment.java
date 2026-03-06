package com.helpshift.support.fragments;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.support.Faq;
import com.helpshift.support.adapters.SearchResultAdapter;
import com.helpshift.support.contracts.SearchResultListener;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SearchResultFragment extends MainFragment {
    public static final String BUNDLE_ARG_SEARCH_RESULTS = "search_fragment_results";
    public static final String FRAGMENT_TAG = "HSSearchResultFragment";
    private View.OnClickListener onQuestionClickedListener;
    RecyclerView searchResultList;
    SearchResultListener searchResultListener;
    private View.OnClickListener sendAnywayClickedListener;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static SearchResultFragment newInstance(Bundle bundle, SearchResultListener searchResultListener) {
        SearchResultFragment searchResultFragment = new SearchResultFragment();
        searchResultFragment.setArguments(bundle);
        searchResultFragment.searchResultListener = searchResultListener;
        return searchResultFragment;
    }

    public void setSearchResultListener(SearchResultListener searchResultListener) {
        this.searchResultListener = searchResultListener;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__search_result_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.search_result);
        this.searchResultList = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        this.onQuestionClickedListener = new View.OnClickListener() { // from class: com.helpshift.support.fragments.SearchResultFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                String str = (String) view2.getTag();
                Faq faq = ((SearchResultAdapter) SearchResultFragment.this.searchResultList.getAdapter()).getFaq(str);
                SearchResultFragment.this.searchResultListener.onQuestionSelected(str, faq != null ? faq.searchTerms : null);
            }
        };
        this.sendAnywayClickedListener = new View.OnClickListener() { // from class: com.helpshift.support.fragments.SearchResultFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                SearchResultFragment.this.searchResultListener.sendAnyway();
            }
        };
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__search_result_title));
        showResults();
    }

    private void showResults() {
        List parcelableArrayList = getArguments().getParcelableArrayList(BUNDLE_ARG_SEARCH_RESULTS);
        if (parcelableArrayList != null && parcelableArrayList.size() > 3) {
            parcelableArrayList = parcelableArrayList.subList(0, 3);
        }
        this.searchResultList.setAdapter(new SearchResultAdapter(parcelableArrayList, this.onQuestionClickedListener, this.sendAnywayClickedListener));
    }
}

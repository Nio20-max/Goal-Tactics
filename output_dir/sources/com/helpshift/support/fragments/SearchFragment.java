package com.helpshift.support.fragments;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.support.Faq;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.HSApiData;
import com.helpshift.support.HSSearch;
import com.helpshift.support.adapters.SearchListAdapter;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class SearchFragment extends MainFragment {
    private static final String KEY_SEARCH_QUERY = "key_search_query";
    public static final String TAG = "Helpshift_SearchFrag";
    String currentQuery;
    HSApiData data;
    FaqTagFilter faqTagFilter;
    private View.OnClickListener onContactUsClickedListener;
    private View.OnClickListener onQuestionClickedListener;
    RecyclerView searchList;
    private final Handler searchResultSuccessHandler = new Handler() { // from class: com.helpshift.support.fragments.SearchFragment.1
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            if (message == null || message.getData() == null || message.obj == null) {
                return;
            }
            String string = message.getData().getString(SearchFragment.KEY_SEARCH_QUERY);
            if (SearchFragment.this.currentQuery == null || !SearchFragment.this.currentQuery.equals(string)) {
                return;
            }
            List<Faq> arrayList = (List) message.obj;
            if (arrayList == null) {
                arrayList = new ArrayList<>();
            }
            SearchFragment.this.updateSearchResult(arrayList);
        }
    };
    private String sectionId;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static SearchFragment newInstance(Bundle bundle) {
        SearchFragment searchFragment = new SearchFragment();
        searchFragment.setArguments(bundle);
        return searchFragment;
    }

    public FaqFragmentListener getFaqFlowListener() {
        return ((FaqFlowViewParent) getParentFragment()).getFaqFlowListener();
    }

    public String getCurrentQuery() {
        return this.currentQuery;
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.faqTagFilter = (FaqTagFilter) arguments.getSerializable("withTagsMatching");
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__search_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.search_list);
        this.searchList = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        this.onQuestionClickedListener = new View.OnClickListener() { // from class: com.helpshift.support.fragments.SearchFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                String str = (String) view2.getTag();
                Faq faq = ((SearchListAdapter) SearchFragment.this.searchList.getAdapter()).getFaq(str);
                SearchFragment.this.getFaqFlowListener().onQuestionSelected(str, faq != null ? faq.searchTerms : null);
            }
        };
        this.onContactUsClickedListener = new View.OnClickListener() { // from class: com.helpshift.support.fragments.SearchFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                SearchFragment.this.getFaqFlowListener().onContactUsClicked(SearchFragment.this.currentQuery);
            }
        };
        if (getArguments() != null) {
            this.sectionId = getArguments().getString("sectionPublishId");
        }
        onQuery(this.currentQuery, this.sectionId);
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        HSApiData hSApiData = new HSApiData(context);
        this.data = hSApiData;
        hSApiData.loadIndex();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.searchList.setAdapter(null);
        this.searchList = null;
        super.onDestroyView();
    }

    public void onQuery(String str, String str2) {
        this.sectionId = str2;
        if (this.searchList == null) {
            return;
        }
        String string = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getString(SDKConfigurationDM.SDK_LANGUAGE);
        if (TextUtils.isEmpty(string)) {
            string = Locale.getDefault().getLanguage();
        }
        boolean z = string.startsWith("zh") || string.equals("ja") || string.equals("ko");
        String strTrim = str == null ? "" : str.trim();
        this.currentQuery = strTrim;
        new Thread(new SearchResultFetcherTask(strTrim, z, str2, this.searchResultSuccessHandler), "HS-search-query").start();
        HSLogger.d(TAG, "Performing search : Query : " + this.currentQuery);
    }

    public int getNumberOfSearchResults() {
        SearchListAdapter searchListAdapter;
        RecyclerView recyclerView = this.searchList;
        if (recyclerView == null || (searchListAdapter = (SearchListAdapter) recyclerView.getAdapter()) == null) {
            return -1;
        }
        return searchListAdapter.getItemCount() - searchListAdapter.getFooterCount();
    }

    void updateSearchResult(List<Faq> list) {
        if (this.searchList == null) {
            return;
        }
        SearchListAdapter searchListAdapter = new SearchListAdapter(this.currentQuery, list, this.onQuestionClickedListener, this.onContactUsClickedListener);
        searchListAdapter.setHasStableIds(true);
        if (this.searchList.getAdapter() == null) {
            this.searchList.setAdapter(searchListAdapter);
        } else {
            this.searchList.swapAdapter(new SearchListAdapter(this.currentQuery, list, this.onQuestionClickedListener, this.onContactUsClickedListener), true);
        }
    }

    private class SearchResultFetcherTask implements Runnable {
        private Handler callback;
        private String query;
        private boolean searchWithAny;
        private String sectionId;

        public SearchResultFetcherTask(String str, boolean z, String str2, Handler handler) {
            this.query = str;
            this.searchWithAny = z;
            this.sectionId = str2;
            this.callback = handler;
        }

        @Override // java.lang.Runnable
        public void run() {
            List<Faq> allFaqs;
            if (TextUtils.isEmpty(this.query) || (this.query.length() < 3 && !this.searchWithAny)) {
                allFaqs = SearchFragment.this.data.getAllFaqs(SearchFragment.this.faqTagFilter);
            } else {
                allFaqs = SearchFragment.this.data.localFaqSearch(this.query, HSSearch.HS_SEARCH_OPTIONS.FULL_SEARCH, SearchFragment.this.faqTagFilter);
            }
            if (!TextUtils.isEmpty(this.sectionId)) {
                ArrayList arrayList = new ArrayList();
                for (Faq faq : allFaqs) {
                    if (faq.section_publish_id.equals(this.sectionId)) {
                        arrayList.add(faq);
                    }
                }
                allFaqs = arrayList;
            }
            Message message = new Message();
            message.obj = allFaqs;
            Bundle bundle = new Bundle();
            bundle.putString(SearchFragment.KEY_SEARCH_QUERY, this.query);
            message.setData(bundle);
            this.callback.sendMessage(message);
        }
    }
}

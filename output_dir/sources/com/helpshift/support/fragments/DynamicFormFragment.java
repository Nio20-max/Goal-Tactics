package com.helpshift.support.fragments;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.support.adapters.FlowListAdapter;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.flows.ConversationFlow;
import com.helpshift.support.flows.DynamicFormFlow;
import com.helpshift.support.flows.FAQSectionFlow;
import com.helpshift.support.flows.FAQsFlow;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.flows.SingleFAQFlow;
import com.helpshift.util.HelpshiftContext;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DynamicFormFragment extends MainFragment implements View.OnClickListener {
    public static final String FRAGMENT_TAG = "HSDynamicFormFragment";
    private List<Flow> flowList;
    private RecyclerView flowListView;
    private boolean sendAnalyticsEvent = true;
    private SupportController supportController;
    private String title;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static DynamicFormFragment newInstance(Bundle bundle, List<Flow> list, SupportController supportController) {
        DynamicFormFragment dynamicFormFragment = new DynamicFormFragment();
        dynamicFormFragment.setArguments(bundle);
        dynamicFormFragment.flowList = list;
        dynamicFormFragment.supportController = supportController;
        return dynamicFormFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            String string = arguments.getString(SupportFragmentConstants.FLOW_TITLE);
            this.title = string;
            if (TextUtils.isEmpty(string)) {
                this.title = getString(R.string.hs__help_header);
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__dynamic_form_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.flow_list);
        this.flowListView = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(this.title);
        showFlows();
    }

    public void setSupportController(SupportController supportController) {
        this.supportController = supportController;
    }

    private void showFlows() {
        List<Flow> list = this.flowList;
        if (list != null) {
            this.flowListView.setAdapter(new FlowListAdapter(list, this));
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Flow flow = this.flowList.get(((Integer) view.getTag()).intValue());
        this.sendAnalyticsEvent = false;
        performAction(flow);
    }

    private void performAction(Flow flow) {
        if (flow instanceof ConversationFlow) {
            ((ConversationFlow) flow).setSupportController(this.supportController);
        } else if (flow instanceof FAQSectionFlow) {
            ((FAQSectionFlow) flow).setSupportController(this.supportController);
        } else if (flow instanceof SingleFAQFlow) {
            ((SingleFAQFlow) flow).setSupportController(this.supportController);
        } else if (flow instanceof DynamicFormFlow) {
            ((DynamicFormFlow) flow).setSupportController(this.supportController);
        } else if (flow instanceof FAQsFlow) {
            ((FAQsFlow) flow).setSupportController(this.supportController);
        }
        flow.performAction();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        if (!isChangingConfigurations() && this.sendAnalyticsEvent) {
            HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.DYNAMIC_FORM_OPEN);
        }
        this.sendAnalyticsEvent = true;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        if (isChangingConfigurations() || !this.sendAnalyticsEvent) {
            return;
        }
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.DYNAMIC_FORM_CLOSE);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        this.flowListView = null;
        super.onDestroyView();
    }
}

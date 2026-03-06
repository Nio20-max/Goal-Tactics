package com.helpshift.support.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.support.flows.Flow;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class FlowListAdapter extends RecyclerView.Adapter<ViewHolder> {
    private List<Flow> flows;
    private View.OnClickListener onClickListener;

    public FlowListAdapter(List<Flow> list, View.OnClickListener onClickListener) {
        this.flows = list;
        this.onClickListener = onClickListener;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        TextView textView = (TextView) LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__simple_list_item_1, viewGroup, false);
        textView.setOnClickListener(this.onClickListener);
        return new ViewHolder(textView);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        String label;
        Flow flow = this.flows.get(i);
        if (flow.getLabelResId() != 0) {
            label = viewHolder.textView.getResources().getString(flow.getLabelResId());
        } else {
            label = flow.getLabel();
        }
        viewHolder.textView.setText(label);
        viewHolder.textView.setTag(Integer.valueOf(i));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.flows.size();
    }

    protected static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textView;

        public ViewHolder(TextView textView) {
            super(textView);
            this.textView = textView;
        }
    }
}

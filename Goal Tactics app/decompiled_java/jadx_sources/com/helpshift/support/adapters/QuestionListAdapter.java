package com.helpshift.support.adapters;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.support.Faq;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class QuestionListAdapter extends RecyclerView.Adapter<ViewHolder> {
    private View.OnClickListener onClickListener;
    private List<Faq> questions;

    public QuestionListAdapter(List<Faq> list, View.OnClickListener onClickListener) {
        this.questions = list;
        this.onClickListener = onClickListener;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        TextView textView = (TextView) LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs_simple_recycler_view_item, viewGroup, false);
        textView.setOnClickListener(this.onClickListener);
        return new ViewHolder(textView);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        Faq faq = this.questions.get(i);
        viewHolder.textView.setText(faq.title);
        viewHolder.textView.setTag(faq.publish_id);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.questions.size();
    }

    protected static class ViewHolder extends RecyclerView.ViewHolder {
        TextView textView;

        public ViewHolder(TextView textView) {
            super(textView);
            this.textView = textView;
        }
    }
}

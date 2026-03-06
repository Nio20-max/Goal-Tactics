package com.helpshift.support.conversations.smartintent;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.smartintent.BaseIntentUIModel;
import com.helpshift.conversation.smartintent.SearchIntentUIModel;
import com.helpshift.conversation.smartintent.SmartIntentType;
import com.helpshift.util.HSViewUtil;
import com.helpshift.util.Styles;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentsListAdapter extends RecyclerView.Adapter<ViewHolder> {
    private SmartIntentListAdapterCallback callback;
    private List<BaseIntentUIModel> intentUIModels;

    public interface SmartIntentListAdapterCallback {
        void onIntentSelected(BaseIntentUIModel baseIntentUIModel);
    }

    public SmartIntentsListAdapter(List<BaseIntentUIModel> list, SmartIntentListAdapterCallback smartIntentListAdapterCallback) {
        this.intentUIModels = list;
        this.callback = smartIntentListAdapterCallback;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(viewGroup.getContext());
        if (i == SmartIntentType.ROOT_INTENT.ordinal()) {
            return new RootIntentViewHolder(layoutInflaterFrom.inflate(R.layout.hs__list_item_smart_intent, viewGroup, false));
        }
        if (i == SmartIntentType.LEAF_INTENT.ordinal()) {
            return new ViewHolder(layoutInflaterFrom.inflate(R.layout.hs__list_item_leaf_intent, viewGroup, false));
        }
        if (i == SmartIntentType.SEARCH_INTENT.ordinal()) {
            return new SearchResultViewHolder(layoutInflaterFrom.inflate(R.layout.hs__list_item_search_intent, viewGroup, false));
        }
        throw new IllegalStateException("Unknown smart intent type : " + i);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        viewHolder.bind(getItem(i), this.callback);
    }

    public void updateIntentUIModels(List<BaseIntentUIModel> list) {
        this.intentUIModels.clear();
        this.intentUIModels.addAll(list);
        notifyDataSetChanged();
    }

    public BaseIntentUIModel getItem(int i) {
        return this.intentUIModels.get(i);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.intentUIModels.size();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemViewType(int i) {
        return getItem(i).getType().ordinal();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        private TextView labelTextView;

        public ViewHolder(View view) {
            super(view);
            this.labelTextView = (TextView) view.findViewById(R.id.hs__smart_intent_text_View);
        }

        public void bind(final BaseIntentUIModel baseIntentUIModel, final SmartIntentListAdapterCallback smartIntentListAdapterCallback) {
            this.labelTextView.setText(baseIntentUIModel.label);
            this.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.smartintent.SmartIntentsListAdapter.ViewHolder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    smartIntentListAdapterCallback.onIntentSelected(baseIntentUIModel);
                }
            });
            this.itemView.setContentDescription(baseIntentUIModel.label);
        }
    }

    public class RootIntentViewHolder extends ViewHolder {
        private ImageView nextIconView;

        RootIntentViewHolder(View view) {
            super(view);
            this.nextIconView = (ImageView) view.findViewById(R.id.hs__smart_intent_next_icon_view);
        }

        @Override // com.helpshift.support.conversations.smartintent.SmartIntentsListAdapter.ViewHolder
        public void bind(BaseIntentUIModel baseIntentUIModel, SmartIntentListAdapterCallback smartIntentListAdapterCallback) {
            super.bind(baseIntentUIModel, smartIntentListAdapterCallback);
            Styles.setColorFilter(this.nextIconView.getContext(), this.nextIconView.getDrawable(), android.R.attr.textColorPrimary);
            if (HSViewUtil.isViewDirectionRtl(this.itemView)) {
                this.nextIconView.setRotationY(180.0f);
            }
            this.itemView.setContentDescription(this.itemView.getContext().getString(R.string.hs__si_root_intent_list_item_voice_over, baseIntentUIModel.label));
        }
    }

    public class SearchResultViewHolder extends ViewHolder {
        private TextView parentLabelTextView;

        SearchResultViewHolder(View view) {
            super(view);
            this.parentLabelTextView = (TextView) view.findViewById(R.id.hs__smart_intent_title_text_View);
        }

        @Override // com.helpshift.support.conversations.smartintent.SmartIntentsListAdapter.ViewHolder
        public void bind(BaseIntentUIModel baseIntentUIModel, SmartIntentListAdapterCallback smartIntentListAdapterCallback) {
            super.bind(baseIntentUIModel, smartIntentListAdapterCallback);
            SearchIntentUIModel searchIntentUIModel = (SearchIntentUIModel) baseIntentUIModel;
            this.parentLabelTextView.setText(searchIntentUIModel.parentLabel);
            this.itemView.setContentDescription(searchIntentUIModel.parentLabel + " " + searchIntentUIModel.label);
        }
    }
}

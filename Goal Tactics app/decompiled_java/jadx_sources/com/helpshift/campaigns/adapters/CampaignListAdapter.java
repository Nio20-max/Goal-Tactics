package com.helpshift.campaigns.adapters;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.PorterDuff;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.campaigns.presenters.CampaignListPresenter;
import com.helpshift.util.Styles;
import com.helpshift.util.TimeUtil;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class CampaignListAdapter extends RecyclerView.Adapter<ViewHolder> {
    private Context context;
    private int menuItemPosition = -1;
    private View.OnClickListener onClickListener;
    private CampaignListPresenter presenter;

    public CampaignListAdapter(CampaignListPresenter campaignListPresenter, View.OnClickListener onClickListener) {
        this.presenter = campaignListPresenter;
        this.onClickListener = onClickListener;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        this.context = viewGroup.getContext();
        RelativeLayout relativeLayout = (RelativeLayout) LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__campaign_recycler_view_item, viewGroup, false);
        relativeLayout.setOnClickListener(this.onClickListener);
        return new ViewHolder(relativeLayout, this.presenter);
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(final ViewHolder viewHolder, int i) {
        viewHolder.title.setText(this.presenter.getTitle(i));
        viewHolder.body.setText(this.presenter.getBody(i));
        HashMap<String, Object> iconImage = this.presenter.getIconImage(i);
        boolean zContainsKey = iconImage.containsKey("default");
        viewHolder.icon.setImageBitmap((Bitmap) iconImage.get("bitmap"));
        if (!zContainsKey) {
            viewHolder.icon.setColorFilter(Styles.getColor(this.context, R.attr.hs__inboxIconBackgroundColor), PorterDuff.Mode.DST_IN);
        } else {
            viewHolder.icon.setColorFilter(Styles.getColor(this.context, R.attr.hs__inboxIconBackgroundColor), PorterDuff.Mode.SRC_OUT);
        }
        viewHolder.date.setText(TimeUtil.getSinceText(this.presenter.getTimestamp(i)));
        if (!this.presenter.getReadStatus(i) && !this.presenter.getSeenStatus(i)) {
            viewHolder.title.setTextColor(Styles.getColor(this.context, R.attr.hs__inboxTitleUnreadTextColor));
            viewHolder.title.setTypeface(viewHolder.title.getTypeface(), 1);
            viewHolder.date.setTextColor(Styles.getColor(this.context, R.attr.hs__inboxTimeStampUnreadTextColor));
            viewHolder.date.setTypeface(viewHolder.date.getTypeface(), 1);
        } else {
            viewHolder.title.setTextColor(Styles.getColor(this.context, R.attr.hs__inboxTitleTextColor));
            viewHolder.title.setTypeface(viewHolder.title.getTypeface(), 0);
            viewHolder.date.setTextColor(Styles.getColor(this.context, R.attr.hs__inboxTimeStampTextColor));
            viewHolder.date.setTypeface(viewHolder.date.getTypeface(), 0);
        }
        viewHolder.itemView.setOnLongClickListener(new View.OnLongClickListener() { // from class: com.helpshift.campaigns.adapters.CampaignListAdapter.1
            @Override // android.view.View.OnLongClickListener
            public boolean onLongClick(View view) {
                CampaignListAdapter.this.setMenuItemPosition(viewHolder.getAdapterPosition());
                return false;
            }
        });
        viewHolder.itemView.setTag(this.presenter.getCampaignId(i));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.presenter.getCountOfCampaigns();
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onViewRecycled(ViewHolder viewHolder) {
        viewHolder.itemView.setOnLongClickListener(null);
        super.onViewRecycled(viewHolder);
    }

    public void removeItem(int i, boolean z) {
        this.presenter.deleteRow(i, z);
        notifyItemRemoved(i);
    }

    public void markCampaignAsRead(int i) {
        this.presenter.markCampaignAsRead(i);
        notifyItemChanged(i);
    }

    public int getMenuItemPosition() {
        return this.menuItemPosition;
    }

    public void setMenuItemPosition(int i) {
        this.menuItemPosition = i;
    }

    public static class ViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener {
        TextView body;
        TextView date;
        ImageView icon;
        private CampaignListPresenter presenter;
        TextView title;

        public ViewHolder(RelativeLayout relativeLayout, CampaignListPresenter campaignListPresenter) {
            super(relativeLayout);
            this.title = (TextView) relativeLayout.findViewById(R.id.campaign_title);
            this.body = (TextView) relativeLayout.findViewById(R.id.campaign_body);
            this.date = (TextView) relativeLayout.findViewById(R.id.campaign_time);
            this.icon = (ImageView) relativeLayout.findViewById(R.id.campaign_icon);
            relativeLayout.setOnCreateContextMenuListener(this);
            this.presenter = campaignListPresenter;
        }

        @Override // android.view.View.OnCreateContextMenuListener
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            contextMenu.add(0, R.id.delete_campaign, 0, R.string.hs__cam_delete);
            if (this.presenter.getReadStatus(getAdapterPosition()) || this.presenter.getSeenStatus(getAdapterPosition())) {
                return;
            }
            contextMenu.add(0, R.id.mark_campaign_as_read, 0, R.string.hs__cam_mark_as_read);
        }
    }
}

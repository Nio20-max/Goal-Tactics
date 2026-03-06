package com.helpshift.campaigns.callbacks;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.view.View;
import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.ItemTouchHelper;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.campaigns.adapters.CampaignListAdapter;
import com.helpshift.campaigns.fragments.CampaignListFragment;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes.dex */
public class CampaignListItemTouchHelperCallback extends ItemTouchHelper.SimpleCallback {
    private CampaignListFragment campaignListFragment;
    private Drawable deleteBackground;
    private Drawable deleteIcon;
    private int deleteIconIntrinsicHeight;
    private int deleteIconIntrinsicWidth;

    @Override // androidx.recyclerview.widget.ItemTouchHelper.Callback
    public boolean onMove(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, RecyclerView.ViewHolder viewHolder2) {
        return false;
    }

    public CampaignListItemTouchHelperCallback(Context context, CampaignListFragment campaignListFragment) {
        super(0, 16);
        this.campaignListFragment = campaignListFragment;
        this.deleteBackground = new ColorDrawable(Styles.getColor(context, R.attr.hs__inboxSwipeToDeleteBackgroundColor));
        Drawable drawable = ResourcesCompat.getDrawable(context.getResources(), R.drawable.hs__cam_delete_icon, null);
        this.deleteIcon = drawable;
        Styles.setColorFilter(context, drawable, R.attr.hs__inboxSwipeToDeleteIconColor);
        this.deleteIconIntrinsicWidth = this.deleteIcon.getIntrinsicWidth();
        this.deleteIconIntrinsicHeight = this.deleteIcon.getIntrinsicWidth();
    }

    @Override // androidx.recyclerview.widget.ItemTouchHelper.Callback
    public void onSwiped(RecyclerView.ViewHolder viewHolder, int i) {
        int adapterPosition = viewHolder.getAdapterPosition();
        if (i == 16) {
            this.campaignListFragment.removeItem(adapterPosition, true);
        }
    }

    @Override // androidx.recyclerview.widget.ItemTouchHelper.Callback
    public void onChildDraw(Canvas canvas, RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder, float f, float f2, int i, boolean z) {
        super.onChildDraw(canvas, recyclerView, viewHolder, f, f2, i, z);
        View view = viewHolder.itemView;
        if (f < 0.0f) {
            this.deleteBackground.setBounds(view.getRight() + ((int) f), view.getTop(), view.getRight(), view.getBottom());
            this.deleteBackground.draw(canvas);
            int top = view.getTop();
            int right = view.getRight();
            int bottom = view.getBottom() - top;
            int i2 = right - 16;
            int i3 = i2 - this.deleteIconIntrinsicWidth;
            int i4 = this.deleteIconIntrinsicHeight;
            int i5 = top + ((bottom - i4) / 2);
            this.deleteIcon.setBounds(i3, i5, i2, i4 + i5);
            this.deleteIcon.draw(canvas);
        }
    }

    @Override // androidx.recyclerview.widget.ItemTouchHelper.SimpleCallback
    public int getSwipeDirs(RecyclerView recyclerView, RecyclerView.ViewHolder viewHolder) {
        if ((viewHolder instanceof CampaignListAdapter.ViewHolder) && viewHolder.getAdapterPosition() == this.campaignListFragment.getMenuItemPosition()) {
            return 0;
        }
        return super.getSwipeDirs(recyclerView, viewHolder);
    }
}

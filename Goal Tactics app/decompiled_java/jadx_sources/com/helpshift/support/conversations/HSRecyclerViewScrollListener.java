package com.helpshift.support.conversations;

import android.os.Handler;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: loaded from: classes2.dex */
public class HSRecyclerViewScrollListener extends RecyclerView.OnScrollListener {
    private final RecyclerViewScrollCallback callback;
    private boolean isScrollStateChangeHandled = false;
    private final Handler uiHandler;

    interface RecyclerViewScrollCallback {
        void onScrolledToBottom();

        void onScrolledToTop();

        void onScrolling();
    }

    public HSRecyclerViewScrollListener(Handler handler, RecyclerViewScrollCallback recyclerViewScrollCallback) {
        this.uiHandler = handler;
        this.callback = recyclerViewScrollCallback;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
    public void onScrollStateChanged(RecyclerView recyclerView, int i) {
        this.isScrollStateChangeHandled = false;
        if (i == 0) {
            computeAndNotifyCallback(recyclerView);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
    public void onScrolled(RecyclerView recyclerView, int i, int i2) {
        if (!this.isScrollStateChangeHandled || recyclerView.getScrollState() == 0) {
            this.isScrollStateChangeHandled = true;
            computeAndNotifyCallback(recyclerView);
        }
    }

    private void computeAndNotifyCallback(RecyclerView recyclerView) {
        View childAt;
        RecyclerView.LayoutManager layoutManager = recyclerView.getLayoutManager();
        boolean z = true;
        if (layoutManager != null) {
            int itemCount = layoutManager.getItemCount();
            int childCount = layoutManager.getChildCount();
            if (childCount > 0 && (childAt = layoutManager.getChildAt(childCount - 1)) != null) {
                int position = layoutManager.getPosition(childAt);
                int i = position + 1;
                if (position != -1 && itemCount != i) {
                    z = false;
                }
            }
        }
        if (!recyclerView.canScrollVertically(-1)) {
            this.uiHandler.post(new Runnable() { // from class: com.helpshift.support.conversations.HSRecyclerViewScrollListener.1
                @Override // java.lang.Runnable
                public void run() {
                    HSRecyclerViewScrollListener.this.callback.onScrolledToTop();
                }
            });
        }
        if (z) {
            this.uiHandler.post(new Runnable() { // from class: com.helpshift.support.conversations.HSRecyclerViewScrollListener.2
                @Override // java.lang.Runnable
                public void run() {
                    HSRecyclerViewScrollListener.this.callback.onScrolledToBottom();
                }
            });
        }
        if (z) {
            return;
        }
        this.uiHandler.post(new Runnable() { // from class: com.helpshift.support.conversations.HSRecyclerViewScrollListener.3
            @Override // java.lang.Runnable
            public void run() {
                HSRecyclerViewScrollListener.this.callback.onScrolling();
            }
        });
    }
}

package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.HistoryLoadingState;
import com.helpshift.support.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class HistoryLoadingViewBinder {
    private Context context;
    private HistoryLoadingClickListener historyLoadingClickListener;

    public interface HistoryLoadingClickListener {
        void onHistoryLoadingRetryClicked();
    }

    public HistoryLoadingViewBinder(Context context) {
        this.context = context;
    }

    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__history_loading_view_layout, viewGroup, false));
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.HistoryLoadingViewBinder$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$HistoryLoadingState;

        static {
            int[] iArr = new int[HistoryLoadingState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$HistoryLoadingState = iArr;
            try {
                iArr[HistoryLoadingState.NONE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$HistoryLoadingState[HistoryLoadingState.LOADING.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$HistoryLoadingState[HistoryLoadingState.ERROR.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0027  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.ViewHolder r6, com.helpshift.conversation.activeconversation.message.HistoryLoadingState r7) {
        /*
            r5 = this;
            int[] r0 = com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$HistoryLoadingState
            int r7 = r7.ordinal()
            r7 = r0[r7]
            r0 = 1
            r1 = 0
            if (r7 == r0) goto L1a
            r2 = 2
            if (r7 == r2) goto L18
            r2 = 3
            if (r7 == r2) goto L15
            r7 = 0
        L13:
            r2 = 0
            goto L1d
        L15:
            r7 = 0
            r2 = 1
            goto L1d
        L18:
            r7 = 1
            goto L13
        L1a:
            r7 = 0
            r0 = 0
            goto L13
        L1d:
            android.view.View r3 = com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.ViewHolder.access$000(r6)
            r4 = 8
            if (r0 == 0) goto L27
            r0 = 0
            goto L29
        L27:
            r0 = 8
        L29:
            r3.setVisibility(r0)
            android.view.View r0 = com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.ViewHolder.access$100(r6)
            if (r7 == 0) goto L34
            r7 = 0
            goto L36
        L34:
            r7 = 8
        L36:
            r0.setVisibility(r7)
            android.view.View r6 = com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.ViewHolder.access$200(r6)
            if (r2 == 0) goto L40
            goto L42
        L40:
            r1 = 8
        L42:
            r6.setVisibility(r1)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.HistoryLoadingViewBinder.bind(com.helpshift.support.conversations.messages.HistoryLoadingViewBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.HistoryLoadingState):void");
    }

    public void setHistoryLoadingClickListener(HistoryLoadingClickListener historyLoadingClickListener) {
        this.historyLoadingClickListener = historyLoadingClickListener;
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        private final View errorStateView;
        private final View layoutView;
        private final View loadingErrorTapToRetry;
        private final View loadingStateView;
        private final ProgressBar progress;

        public ViewHolder(View view) {
            super(view);
            this.layoutView = this.itemView.findViewById(R.id.history_loading_layout_view);
            this.loadingStateView = this.itemView.findViewById(R.id.loading_state_view);
            this.errorStateView = this.itemView.findViewById(R.id.loading_error_state_view);
            View viewFindViewById = this.itemView.findViewById(R.id.loading_error_tap_to_retry);
            this.loadingErrorTapToRetry = viewFindViewById;
            viewFindViewById.setOnClickListener(this);
            ProgressBar progressBar = (ProgressBar) this.itemView.findViewById(R.id.loading_progressbar);
            this.progress = progressBar;
            Styles.setAccentColor(HistoryLoadingViewBinder.this.context, progressBar.getIndeterminateDrawable());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (HistoryLoadingViewBinder.this.historyLoadingClickListener != null) {
                HistoryLoadingViewBinder.this.historyLoadingClickListener.onHistoryLoadingRetryClicked();
            }
        }
    }
}

package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.SystemPublishIdMessageDM;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class SystemPublishIdMessageDataBinder extends MessageViewDataBinder<ViewHolder, SystemPublishIdMessageDM> {
    public SystemPublishIdMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_publish_id_layout, viewGroup, false));
        viewHolder.setListeners();
        return viewHolder;
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, SystemPublishIdMessageDM systemPublishIdMessageDM) {
        RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) viewHolder.itemView.getLayoutParams();
        if (systemPublishIdMessageDM.isFirstMessageInList) {
            layoutParams.topMargin = (int) Styles.dpToPx(this.context, 18.0f);
        } else {
            layoutParams.topMargin = 0;
        }
        viewHolder.itemView.setLayoutParams(layoutParams);
        viewHolder.label.setText(this.context.getString(R.string.hs__conversation_issue_id_header, systemPublishIdMessageDM.body));
        viewHolder.label.setContentDescription(this.context.getString(R.string.hs__conversation_publish_id_voice_over, systemPublishIdMessageDM.body));
    }

    public class ViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener {
        private final TextView label;

        public ViewHolder(View view) {
            super(view);
            this.label = (TextView) view.findViewById(R.id.issue_publish_id_label);
        }

        void setListeners() {
            this.label.setOnCreateContextMenuListener(this);
        }

        @Override // android.view.View.OnCreateContextMenuListener
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            if (SystemPublishIdMessageDataBinder.this.messageClickListener != null) {
                String[] strArrSplit = ((TextView) view).getText().toString().split("#");
                if (strArrSplit.length > 1) {
                    SystemPublishIdMessageDataBinder.this.messageClickListener.onCreateContextMenu(contextMenu, strArrSplit[1]);
                }
            }
        }
    }
}

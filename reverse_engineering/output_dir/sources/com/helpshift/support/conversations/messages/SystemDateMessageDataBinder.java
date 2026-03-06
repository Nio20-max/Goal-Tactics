package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.SystemDateMessageDM;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class SystemDateMessageDataBinder extends MessageViewDataBinder<ViewHolder, SystemDateMessageDM> {
    public SystemDateMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_system_layout, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, SystemDateMessageDM systemDateMessageDM) {
        RecyclerView.LayoutParams layoutParams = (RecyclerView.LayoutParams) viewHolder.itemView.getLayoutParams();
        if (systemDateMessageDM.isFirstMessageInList) {
            layoutParams.topMargin = (int) Styles.dpToPx(this.context, 18.0f);
        } else {
            layoutParams.topMargin = (int) Styles.dpToPx(this.context, 2.0f);
        }
        viewHolder.itemView.setLayoutParams(layoutParams);
        viewHolder.body.setText(systemDateMessageDM.getBodyText());
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        private final TextView body;

        public ViewHolder(View view) {
            super(view);
            this.body = (TextView) view.findViewById(R.id.system_message);
        }
    }
}

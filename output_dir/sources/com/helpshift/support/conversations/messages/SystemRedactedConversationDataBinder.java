package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.SystemRedactedConversationMessageDM;

/* JADX INFO: loaded from: classes2.dex */
public class SystemRedactedConversationDataBinder extends MessageViewDataBinder<ViewHolder, SystemRedactedConversationMessageDM> {
    public SystemRedactedConversationDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_system_conversation_redacted_layout, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, SystemRedactedConversationMessageDM systemRedactedConversationMessageDM) {
        String string;
        int i = systemRedactedConversationMessageDM.contiguousRedactedConversationsCount;
        if (systemRedactedConversationMessageDM.contiguousRedactedConversationsCount > 1) {
            string = this.context.getString(R.string.hs__conversation_redacted_status_multiple, Integer.valueOf(i));
        } else {
            string = this.context.getString(R.string.hs__conversation_redacted_status);
        }
        viewHolder.redactedTextView.setText(string);
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        private TextView redactedTextView;

        public ViewHolder(View view) {
            super(view);
            this.redactedTextView = (TextView) view.findViewById(R.id.conversation_redacted_view);
        }
    }
}

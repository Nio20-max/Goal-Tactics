package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.SystemDividerMessageDM;

/* JADX INFO: loaded from: classes2.dex */
public class SystemDividerMessageDataBinder extends MessageViewDataBinder<ViewHolder, SystemDividerMessageDM> {
    public SystemDividerMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_system_divider_layout, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, SystemDividerMessageDM systemDividerMessageDM) {
        String string;
        if (systemDividerMessageDM.showDividerText) {
            viewHolder.dividerHeader.setVisibility(0);
            string = "";
        } else {
            viewHolder.dividerHeader.setVisibility(8);
            string = this.context.getString(R.string.hs__conversations_divider_voice_over);
        }
        viewHolder.dividerView.setContentDescription(string);
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        private TextView dividerHeader;
        private View dividerView;

        public ViewHolder(View view) {
            super(view);
            this.dividerView = view.findViewById(R.id.conversations_divider);
            this.dividerHeader = (TextView) view.findViewById(R.id.conversation_closed_view);
        }
    }
}

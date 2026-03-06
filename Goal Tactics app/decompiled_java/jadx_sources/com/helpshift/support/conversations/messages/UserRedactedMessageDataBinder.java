package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;

/* JADX INFO: loaded from: classes2.dex */
public class UserRedactedMessageDataBinder extends MessageViewDataBinder<ViewHolder, MessageDM> {
    public UserRedactedMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_txt_user, viewGroup, false));
        setUserMessageLayoutMargin(viewHolder.messageBubble.getLayoutParams());
        viewHolder.setListeners();
        return viewHolder;
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, MessageDM messageDM) {
        viewHolder.messageText.setText(getRedactedBodyText(escapeHtml(messageDM.body)));
        applyRedactionStyle(viewHolder.messageText);
        viewHolder.messageLayout.setContentDescription(this.context.getString(R.string.hs__user_sent_message_voice_over, messageDM.getAccessbilityMessageTime()));
        linkify(viewHolder.messageText, null);
        UIViewState uiViewState = messageDM.getUiViewState();
        setUserMessageContainerBackground(viewHolder.messageBubble, uiViewState);
        setUserMessageSubText(viewHolder.subText, uiViewState, messageDM.getSubText());
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener {
        final FrameLayout messageBubble;
        final View messageLayout;
        final TextView messageText;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageText = (TextView) view.findViewById(R.id.user_message_text);
            this.subText = (TextView) view.findViewById(R.id.user_date_text);
            this.messageBubble = (FrameLayout) view.findViewById(R.id.user_message_container);
            this.messageLayout = view.findViewById(R.id.user_text_message_layout);
        }

        void setListeners() {
            this.messageText.setOnCreateContextMenuListener(this);
        }

        @Override // android.view.View.OnCreateContextMenuListener
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            if (UserRedactedMessageDataBinder.this.messageClickListener != null) {
                UserRedactedMessageDataBinder.this.messageClickListener.onCreateContextMenu(contextMenu, ((TextView) view).getText().toString());
            }
        }
    }
}

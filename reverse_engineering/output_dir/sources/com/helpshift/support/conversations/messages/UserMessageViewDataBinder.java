package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;

/* JADX INFO: loaded from: classes2.dex */
public class UserMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, UserMessageDM> {
    public UserMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_txt_user, viewGroup, false));
        setUserMessageLayoutMargin(viewHolder.messageBubble.getLayoutParams());
        viewHolder.setListeners();
        return viewHolder;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x00ae  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00cd  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00d3  */
    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.UserMessageViewDataBinder.ViewHolder r10, com.helpshift.conversation.activeconversation.message.UserMessageDM r11) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.UserMessageViewDataBinder.bind(com.helpshift.support.conversations.messages.UserMessageViewDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.UserMessageDM):void");
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.UserMessageViewDataBinder$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState;

        static {
            int[] iArr = new int[UserMessageState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState = iArr;
            try {
                iArr[UserMessageState.UNSENT_NOT_RETRYABLE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.UNSENT_RETRYABLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.SENDING.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.SENT.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder implements View.OnCreateContextMenuListener, View.OnClickListener {
        final FrameLayout messageBubble;
        final View messageLayout;
        final TextView messageText;
        final ImageView retryButton;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageText = (TextView) view.findViewById(R.id.user_message_text);
            this.subText = (TextView) view.findViewById(R.id.user_date_text);
            this.messageBubble = (FrameLayout) view.findViewById(R.id.user_message_container);
            this.retryButton = (ImageView) view.findViewById(R.id.user_message_retry_button);
            this.messageLayout = view.findViewById(R.id.user_text_message_layout);
        }

        void setListeners() {
            this.messageText.setOnCreateContextMenuListener(this);
        }

        @Override // android.view.View.OnCreateContextMenuListener
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            if (UserMessageViewDataBinder.this.messageClickListener != null) {
                UserMessageViewDataBinder.this.messageClickListener.onCreateContextMenu(contextMenu, ((TextView) view).getText().toString());
            }
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (UserMessageViewDataBinder.this.messageClickListener != null) {
                UserMessageViewDataBinder.this.messageClickListener.retryMessage(getAdapterPosition());
            }
        }
    }
}

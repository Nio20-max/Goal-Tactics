package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;

/* JADX INFO: loaded from: classes2.dex */
public class UserResponseCSATMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, UserResponseMessageForCSATInput> {
    public UserResponseCSATMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_csat_user_rsp, viewGroup, false));
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
    public void bind(com.helpshift.support.conversations.messages.UserResponseCSATMessageViewDataBinder.ViewHolder r10, com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput r11) {
        /*
            Method dump skipped, instruction units count: 238
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.UserResponseCSATMessageViewDataBinder.bind(com.helpshift.support.conversations.messages.UserResponseCSATMessageViewDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput):void");
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.UserResponseCSATMessageViewDataBinder$1, reason: invalid class name */
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
        final RelativeLayout messageBubble;
        final View messageLayout;
        final TextView messageText;
        final RatingBar ratingBar;
        final ImageView retryButton;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.ratingBar = (RatingBar) view.findViewById(R.id.csat_selected_rating);
            this.messageText = (TextView) view.findViewById(R.id.user_message_text);
            this.subText = (TextView) view.findViewById(R.id.user_date_text);
            this.messageBubble = (RelativeLayout) view.findViewById(R.id.user_message_container);
            this.retryButton = (ImageView) view.findViewById(R.id.user_message_retry_button);
            this.messageLayout = view.findViewById(R.id.user_csat_rsp_message_layout);
        }

        void setListeners() {
            this.messageText.setOnCreateContextMenuListener(this);
        }

        @Override // android.view.View.OnCreateContextMenuListener
        public void onCreateContextMenu(ContextMenu contextMenu, View view, ContextMenu.ContextMenuInfo contextMenuInfo) {
            if (UserResponseCSATMessageViewDataBinder.this.messageClickListener != null) {
                UserResponseCSATMessageViewDataBinder.this.messageClickListener.onCreateContextMenu(contextMenu, ((TextView) view).getText().toString());
            }
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (UserResponseCSATMessageViewDataBinder.this.messageClickListener != null) {
                UserResponseCSATMessageViewDataBinder.this.messageClickListener.retryMessage(getAdapterPosition());
            }
        }
    }
}

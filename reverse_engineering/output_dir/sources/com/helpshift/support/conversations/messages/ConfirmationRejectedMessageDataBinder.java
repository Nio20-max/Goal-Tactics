package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
class ConfirmationRejectedMessageDataBinder extends MessageViewDataBinder<ViewHolder, ConfirmationRejectedMessageDM> {
    ConfirmationRejectedMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_txt_admin, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, ConfirmationRejectedMessageDM confirmationRejectedMessageDM) {
        viewHolder.message.setText(R.string.hs__cr_msg);
        UIViewState uiViewState = confirmationRejectedMessageDM.getUiViewState();
        setDrawable(viewHolder.messageContainer, uiViewState.isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_admin, R.attr.hs__chatBubbleAdminBackgroundColor);
        if (uiViewState.isFooterVisible()) {
            viewHolder.subText.setText(confirmationRejectedMessageDM.getSystemMessageNickname() + ", " + confirmationRejectedMessageDM.getSubText());
        }
        viewHolder.messageLayout.setContentDescription(getAdminMessageContentDesciption(confirmationRejectedMessageDM));
        setViewVisibility(viewHolder.subText, uiViewState.isFooterVisible());
        setAuthorAvatar(confirmationRejectedMessageDM, viewHolder.avatarImageView);
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final CircleImageView avatarImageView;
        final TextView message;
        final View messageContainer;
        final View messageLayout;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.admin_text_message_layout);
            this.message = (TextView) view.findViewById(R.id.admin_message_text);
            this.subText = (TextView) view.findViewById(R.id.admin_date_text);
            this.messageContainer = view.findViewById(R.id.admin_message_container);
            this.avatarImageView = (CircleImageView) view.findViewById(R.id.avatar_image_view);
        }
    }
}

package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
public class RequestAppReviewMessageDataBinder extends MessageViewDataBinder<ViewHolder, RequestAppReviewMessageDM> {
    public RequestAppReviewMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_review_request, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, final RequestAppReviewMessageDM requestAppReviewMessageDM) {
        viewHolder.message.setText(R.string.hs__review_request_message);
        if (requestAppReviewMessageDM.isAnswered) {
            viewHolder.reviewButton.setVisibility(8);
        } else {
            viewHolder.reviewButton.setVisibility(0);
        }
        UIViewState uiViewState = requestAppReviewMessageDM.getUiViewState();
        setDrawable(viewHolder.messageContainer, uiViewState.isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_admin, R.attr.hs__chatBubbleAdminBackgroundColor);
        if (uiViewState.isFooterVisible()) {
            viewHolder.subText.setText(requestAppReviewMessageDM.getSubText());
        }
        setViewVisibility(viewHolder.subText, uiViewState.isFooterVisible());
        if (requestAppReviewMessageDM.isReviewButtonClickable) {
            viewHolder.reviewButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.messages.RequestAppReviewMessageDataBinder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (RequestAppReviewMessageDataBinder.this.messageClickListener != null) {
                        RequestAppReviewMessageDataBinder.this.messageClickListener.handleReplyReviewButtonClick(requestAppReviewMessageDM);
                    }
                }
            });
        } else {
            viewHolder.reviewButton.setOnClickListener(null);
        }
        viewHolder.messageLayout.setContentDescription(getAdminMessageContentDesciption(requestAppReviewMessageDM));
        setAuthorAvatar(requestAppReviewMessageDM, viewHolder.avatarImageView);
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final CircleImageView avatarImageView;
        final TextView message;
        final View messageContainer;
        final View messageLayout;
        final Button reviewButton;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.admin_review_message_layout);
            this.message = (TextView) view.findViewById(R.id.review_request_message);
            this.reviewButton = (Button) view.findViewById(R.id.review_request_button);
            this.subText = (TextView) view.findViewById(R.id.review_request_date);
            this.messageContainer = view.findViewById(R.id.review_request_message_container);
            this.avatarImageView = (CircleImageView) view.findViewById(R.id.avatar_image_view);
        }
    }
}

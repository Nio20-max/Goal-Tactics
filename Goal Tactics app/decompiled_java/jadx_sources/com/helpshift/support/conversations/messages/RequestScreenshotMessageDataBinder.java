package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.support.util.Styles;
import com.helpshift.util.HSLinkify;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
public class RequestScreenshotMessageDataBinder extends MessageViewDataBinder<ViewHolder, RequestScreenshotMessageDM> {
    public RequestScreenshotMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_request_screenshot, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, final RequestScreenshotMessageDM requestScreenshotMessageDM) {
        viewHolder.adminRequestText.setText(escapeHtml(requestScreenshotMessageDM.body));
        setViewVisibility(viewHolder.attachButton, requestScreenshotMessageDM.isAttachmentAllowed());
        UIViewState uiViewState = requestScreenshotMessageDM.getUiViewState();
        setDrawable(viewHolder.adminMessage, uiViewState.isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_admin, R.attr.hs__chatBubbleAdminBackgroundColor);
        if (uiViewState.isFooterVisible()) {
            viewHolder.subText.setText(requestScreenshotMessageDM.getSubText());
        }
        setViewVisibility(viewHolder.subText, uiViewState.isFooterVisible());
        viewHolder.attachButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.messages.RequestScreenshotMessageDataBinder.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!requestScreenshotMessageDM.isAttachmentButtonClickable() || RequestScreenshotMessageDataBinder.this.messageClickListener == null) {
                    return;
                }
                RequestScreenshotMessageDataBinder.this.messageClickListener.launchImagePicker(requestScreenshotMessageDM);
            }
        });
        viewHolder.messageLayout.setContentDescription(getAdminMessageContentDesciption(requestScreenshotMessageDM));
        linkify(viewHolder.adminRequestText, new HSLinkify.LinkClickListener() { // from class: com.helpshift.support.conversations.messages.RequestScreenshotMessageDataBinder.2
            @Override // com.helpshift.util.HSLinkify.LinkClickListener
            public void onLinkClicked(String str) {
                if (RequestScreenshotMessageDataBinder.this.messageClickListener != null) {
                    RequestScreenshotMessageDataBinder.this.messageClickListener.onAdminMessageLinkClicked(str, requestScreenshotMessageDM);
                }
            }

            @Override // com.helpshift.util.HSLinkify.LinkClickListener
            public void onLinkClickFailed() {
                if (RequestScreenshotMessageDataBinder.this.messageClickListener != null) {
                    RequestScreenshotMessageDataBinder.this.messageClickListener.onAdminMessageLinkClickFailed();
                }
            }
        });
        setAuthorAvatar(requestScreenshotMessageDM, viewHolder.avatarImageView);
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        private final LinearLayout adminMessage;
        final TextView adminRequestText;
        final Button attachButton;
        final CircleImageView avatarImageView;
        final View messageLayout;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.agent_screenshot_request_message_layout);
            this.adminRequestText = (TextView) view.findViewById(R.id.admin_attachment_request_text);
            this.attachButton = (Button) view.findViewById(R.id.admin_attach_screenshot_button);
            LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.admin_message);
            this.adminMessage = linearLayout;
            this.subText = (TextView) view.findViewById(R.id.admin_date_text);
            this.avatarImageView = (CircleImageView) view.findViewById(R.id.avatar_image_view);
            Styles.setAdminChatBubbleColor(RequestScreenshotMessageDataBinder.this.context, linearLayout.getBackground());
        }
    }
}

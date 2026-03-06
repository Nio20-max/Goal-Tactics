package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.text.Html;
import android.util.TypedValue;
import android.view.ContextMenu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.RecyclerView.ViewHolder;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.util.HSLinkify;
import com.helpshift.util.HSPattern;
import com.helpshift.util.StringUtils;
import com.helpshift.util.Styles;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
public abstract class MessageViewDataBinder<VH extends RecyclerView.ViewHolder, M extends MessageDM> {
    protected static final float BUBBLE_OPAGUE = 1.0f;
    protected static final float BUBBLE_TRANSLUCENT = 0.5f;
    protected Context context;
    protected MessageItemClickListener messageClickListener;

    public interface MessageItemClickListener {
        void downloadAvatarImage(MessageDM messageDM);

        void handleAdminImageAttachmentMessageClick(AdminImageAttachmentMessageDM adminImageAttachmentMessageDM);

        void handleGenericAttachmentMessageClick(AdminAttachmentMessageDM adminAttachmentMessageDM);

        void handleOptionSelected(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z);

        void handleReplyReviewButtonClick(RequestAppReviewMessageDM requestAppReviewMessageDM);

        void launchImagePicker(RequestScreenshotMessageDM requestScreenshotMessageDM);

        void onActionCardClicked(AdminActionCardMessageDM adminActionCardMessageDM);

        void onAdminMessageLinkClickFailed();

        void onAdminMessageLinkClicked(String str, MessageDM messageDM);

        void onAdminSuggestedQuestionSelected(FAQListMessageDM fAQListMessageDM, String str, String str2);

        void onCSATSurveyRequestedFromBot(String str);

        void onCSATSurveyStartedFromBot(String str);

        void onCreateContextMenu(ContextMenu contextMenu, String str);

        void onScreenshotMessageClicked(ScreenshotMessageDM screenshotMessageDM);

        void onSendFeedbackClick(int i, AdminCSATMessageWithOptions adminCSATMessageWithOptions);

        void onStartNewConversationButtonClickFromCSATBot(AdminCSATMessageWithOptions adminCSATMessageWithOptions);

        void onUserAttachmentMessageClicked(UserAttachmentMessageDM userAttachmentMessageDM);

        void retryMessage(int i);
    }

    public abstract void bind(VH vh, M m);

    public abstract VH createViewHolder(ViewGroup viewGroup);

    public MessageViewDataBinder(Context context) {
        this.context = context;
    }

    public void setMessageItemClickListener(MessageItemClickListener messageItemClickListener) {
        this.messageClickListener = messageItemClickListener;
    }

    protected void linkify(TextView textView, HSLinkify.LinkClickListener linkClickListener) {
        HSLinkify.addLinks(textView, 14, linkClickListener);
        HSLinkify.addLinks(textView, HSPattern.getUrlPattern(), (String) null, (HSLinkify.MatchFilter) null, (HSLinkify.TransformFilter) null, linkClickListener);
    }

    String escapeHtml(String str) {
        return Html.fromHtml(str.replace("\n", "<br/>")).toString();
    }

    String getRedactedBodyText(String str) {
        return str + " ";
    }

    protected void setAdminMessageContainerBackground(View view, UIViewState uIViewState) {
        setDrawable(view, uIViewState.isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_admin, R.attr.hs__chatBubbleAdminBackgroundColor);
    }

    protected void setAdminMessageSubText(TextView textView, UIViewState uIViewState, String str) {
        textView.setText(str);
        setViewVisibility(textView, uIViewState.isFooterVisible());
    }

    protected void setUserMessageSubText(TextView textView, UIViewState uIViewState, String str) {
        textView.setText(str);
        setViewVisibility(textView, uIViewState.isFooterVisible());
    }

    protected void setUserMessageContainerBackground(View view, UIViewState uIViewState) {
        setDrawable(view, uIViewState.isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_user, R.attr.hs__chatBubbleUserBackgroundColor);
    }

    public void setAuthorAvatar(MessageDM messageDM, CircleImageView circleImageView) {
        UIViewState uiViewState = messageDM.getUiViewState();
        if (messageDM.shouldShowAvatar()) {
            if (uiViewState.isFooterVisible() && !uiViewState.isRoundedBackground()) {
                setViewVisibility(circleImageView, true);
                AvatarImageLoader.loadAvatarImageAccordingToState(this.context, messageDM, circleImageView);
                MessageItemClickListener messageItemClickListener = this.messageClickListener;
                if (messageItemClickListener != null) {
                    messageItemClickListener.downloadAvatarImage(messageDM);
                    return;
                }
                return;
            }
            circleImageView.setVisibility(4);
            return;
        }
        setViewVisibility(circleImageView, false);
    }

    protected void setAdminMessageLayoutMarginForAvatar(ViewGroup.LayoutParams layoutParams) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        marginLayoutParams.setMargins((int) this.context.getResources().getDimension(R.dimen.hs__author_avatar_size), marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
    }

    protected void setUserMessageLayoutMargin(ViewGroup.LayoutParams layoutParams) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        float f = this.context.getResources().getDisplayMetrics().widthPixels;
        TypedValue typedValue = new TypedValue();
        this.context.getResources().getValue(R.dimen.hs__screen_to_conversation_view_ratio, typedValue, true);
        marginLayoutParams.setMargins((int) (f * typedValue.getFloat() * 0.2f), marginLayoutParams.topMargin, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
    }

    protected void setViewVisibility(View view, boolean z) {
        if (z) {
            view.setVisibility(0);
        } else {
            view.setVisibility(8);
        }
    }

    protected void setDrawable(View view, int i, int i2) {
        Styles.setDrawable(this.context, view, i, i2);
    }

    protected String getAdminMessageContentDesciption(MessageDM messageDM) {
        String displayedAuthorName = messageDM.getDisplayedAuthorName();
        String accessbilityMessageTime = messageDM.getAccessbilityMessageTime();
        return StringUtils.isEmpty(displayedAuthorName) ? this.context.getString(R.string.hs__agent_message_voice_over, accessbilityMessageTime) : this.context.getString(R.string.hs__agent_message_with_name_voice_over, displayedAuthorName, accessbilityMessageTime);
    }

    void applyRedactionStyle(TextView textView) {
        textView.setTypeface(textView.getTypeface(), 2);
        textView.setAlpha(0.55f);
    }
}

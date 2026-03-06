package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.util.HSLinkify;
import com.helpshift.util.StringUtils;
import com.helpshift.util.Styles;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
public class AdminSuggestionsMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, FAQListMessageDM> {
    AdminSuggestionsMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_admin_suggesstions_container, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, final FAQListMessageDM fAQListMessageDM) {
        Drawable[] compoundDrawables;
        bindAdminMessage(viewHolder, fAQListMessageDM);
        viewHolder.suggestionsList.removeAllViews();
        TableRow tableRow = null;
        for (final FAQListMessageDM.FAQ faq : fAQListMessageDM.faqs) {
            View viewInflate = LayoutInflater.from(this.context).inflate(R.layout.hs__msg_admin_suggesstion_item, (ViewGroup) null);
            TextView textView = (TextView) viewInflate.findViewById(R.id.admin_suggestion_message);
            textView.setText(faq.title);
            if (Build.VERSION.SDK_INT >= 17) {
                compoundDrawables = textView.getCompoundDrawablesRelative();
            } else {
                compoundDrawables = textView.getCompoundDrawables();
            }
            Styles.setColorFilter(this.context, compoundDrawables[2], R.attr.hs__adminFaqSuggestionArrowColor);
            TableRow tableRow2 = new TableRow(this.context);
            tableRow2.addView(viewInflate);
            View viewInflate2 = LayoutInflater.from(this.context).inflate(R.layout.hs__section_divider, (ViewGroup) null);
            viewInflate2.findViewById(R.id.divider).setBackgroundColor(Styles.getColor(this.context, R.attr.hs__contentSeparatorColor));
            TableRow tableRow3 = new TableRow(this.context);
            tableRow3.addView(viewInflate2);
            viewHolder.suggestionsList.addView(tableRow2);
            viewHolder.suggestionsList.addView(tableRow3);
            viewInflate.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.messages.AdminSuggestionsMessageViewDataBinder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    AdminSuggestionsMessageViewDataBinder.this.messageClickListener.onAdminSuggestedQuestionSelected(fAQListMessageDM, faq.publishId, faq.language);
                }
            });
            tableRow = tableRow3;
        }
        viewHolder.suggestionsList.removeView(tableRow);
        UIViewState uiViewState = fAQListMessageDM.getUiViewState();
        setViewVisibility(viewHolder.dateText, uiViewState.isFooterVisible());
        if (uiViewState.isFooterVisible()) {
            viewHolder.dateText.setText(fAQListMessageDM.getSubText());
        }
        viewHolder.messageLayout.setContentDescription(getAdminMessageContentDesciption(fAQListMessageDM));
    }

    private void bindAdminMessage(ViewHolder viewHolder, final MessageDM messageDM) {
        if (StringUtils.isEmpty(messageDM.body)) {
            viewHolder.messageContainer.setVisibility(8);
            return;
        }
        viewHolder.messageContainer.setVisibility(0);
        viewHolder.messageText.setText(escapeHtml(messageDM.body));
        setDrawable(viewHolder.messageContainer, messageDM.getUiViewState().isRoundedBackground() ? R.drawable.hs__chat_bubble_rounded : R.drawable.hs__chat_bubble_admin, R.attr.hs__chatBubbleAdminBackgroundColor);
        viewHolder.messageContainer.setContentDescription(getAdminMessageContentDesciption(messageDM));
        linkify(viewHolder.messageText, new HSLinkify.LinkClickListener() { // from class: com.helpshift.support.conversations.messages.AdminSuggestionsMessageViewDataBinder.2
            @Override // com.helpshift.util.HSLinkify.LinkClickListener
            public void onLinkClicked(String str) {
                if (AdminSuggestionsMessageViewDataBinder.this.messageClickListener != null) {
                    AdminSuggestionsMessageViewDataBinder.this.messageClickListener.onAdminMessageLinkClicked(str, messageDM);
                }
            }

            @Override // com.helpshift.util.HSLinkify.LinkClickListener
            public void onLinkClickFailed() {
                if (AdminSuggestionsMessageViewDataBinder.this.messageClickListener != null) {
                    AdminSuggestionsMessageViewDataBinder.this.messageClickListener.onAdminMessageLinkClickFailed();
                }
            }
        });
        setAuthorAvatar(messageDM, viewHolder.avatarImageView);
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final CircleImageView avatarImageView;
        final TextView dateText;
        final View messageContainer;
        final View messageLayout;
        final TextView messageText;
        final TableLayout suggestionsList;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.admin_suggestion_message_layout);
            this.suggestionsList = (TableLayout) view.findViewById(R.id.suggestionsListStub);
            this.messageText = (TextView) view.findViewById(R.id.admin_message_text);
            this.messageContainer = view.findViewById(R.id.admin_message_container);
            this.dateText = (TextView) view.findViewById(R.id.admin_date_text);
            this.avatarImageView = (CircleImageView) view.findViewById(R.id.avatar_image_view);
        }
    }
}

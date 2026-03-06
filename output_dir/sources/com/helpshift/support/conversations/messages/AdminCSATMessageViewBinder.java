package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.input.CSATRatingsInput;
import com.helpshift.support.widget.AdminCSATBotView;
import com.helpshift.util.Styles;
import com.helpshift.views.HSButton;
import com.helpshift.views.HSTextView;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class AdminCSATMessageViewBinder extends MessageViewDataBinder<ViewHolder, AdminCSATMessageWithOptions> {
    private final Context context;
    private String lastMessageId;

    AdminCSATMessageViewBinder(Context context) {
        super(context);
        this.lastMessageId = "";
        this.context = context;
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__admin_csat_message, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(final ViewHolder viewHolder, final AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        if (this.lastMessageId.equals(adminCSATMessageWithOptions.serverId)) {
            return;
        }
        this.lastMessageId = adminCSATMessageWithOptions.serverId;
        viewHolder.csatView.reset();
        viewHolder.csatBotLikedText.setVisibility(0);
        viewHolder.csatBotDislikeText.setVisibility(0);
        viewHolder.csatBotSelectedRatingText.setVisibility(8);
        viewHolder.csatMessageText.setText(adminCSATMessageWithOptions.body);
        final CSATRatingsInput cSATRatingsInput = adminCSATMessageWithOptions.csatRatingsInput;
        List<CSATRatingsInput.Rating> list = cSATRatingsInput.ratings;
        int size = list.size();
        if (size > 0) {
            String str = list.get(0).title;
            String str2 = list.get(size - 1).title;
            viewHolder.csatBotDislikeText.setText(str);
            viewHolder.csatBotLikedText.setText(str2);
        }
        viewHolder.sendFeedbackButton.setText(cSATRatingsInput.sendFeedbackLabel);
        viewHolder.newConversationButton.setText(cSATRatingsInput.startNewConversationLabel);
        viewHolder.csatView.setAdminCSATBotListener(new AdminCSATBotView.AdminCSATBotViewListener() { // from class: com.helpshift.support.conversations.messages.AdminCSATMessageViewBinder.1
            @Override // com.helpshift.support.widget.AdminCSATBotView.AdminCSATBotViewListener
            public void onRatingChanged(int i) {
                viewHolder.sendFeedbackButton.setVisibility(0);
                viewHolder.csatBotLikedText.setVisibility(8);
                viewHolder.csatBotDislikeText.setVisibility(8);
                Iterator<CSATRatingsInput.Rating> it = cSATRatingsInput.ratings.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    CSATRatingsInput.Rating next = it.next();
                    if (i == next.value) {
                        viewHolder.csatBotSelectedRatingText.setText(next.title);
                        break;
                    }
                }
                viewHolder.csatBotSelectedRatingText.setVisibility(0);
                if (AdminCSATMessageViewBinder.this.messageClickListener != null) {
                    AdminCSATMessageViewBinder.this.messageClickListener.onCSATSurveyStartedFromBot(adminCSATMessageWithOptions.serverId);
                }
            }

            @Override // com.helpshift.support.widget.AdminCSATBotView.AdminCSATBotViewListener
            public void sendCSATSurvey(int i) {
                if (AdminCSATMessageViewBinder.this.messageClickListener != null) {
                    AdminCSATMessageViewBinder.this.messageClickListener.onSendFeedbackClick(i, adminCSATMessageWithOptions);
                }
            }

            @Override // com.helpshift.support.widget.AdminCSATBotView.AdminCSATBotViewListener
            public void onCSATSurveyRequested() {
                if (AdminCSATMessageViewBinder.this.messageClickListener != null) {
                    AdminCSATMessageViewBinder.this.messageClickListener.onCSATSurveyRequestedFromBot(adminCSATMessageWithOptions.serverId);
                }
            }
        });
        viewHolder.newConversationButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.messages.AdminCSATMessageViewBinder.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AdminCSATMessageViewBinder.this.messageClickListener != null) {
                    AdminCSATMessageViewBinder.this.messageClickListener.onStartNewConversationButtonClickFromCSATBot(adminCSATMessageWithOptions);
                }
            }
        });
        if (adminCSATMessageWithOptions.csatRatingsInput.showNewConversationButton) {
            return;
        }
        viewHolder.bottomDividerLayout.setVisibility(8);
        viewHolder.newConversationButton.setVisibility(8);
    }

    public final class ViewHolder extends RecyclerView.ViewHolder {
        final LinearLayout bottomDividerLayout;
        final HSTextView csatBotDislikeText;
        final HSTextView csatBotLikedText;
        final HSTextView csatBotSelectedRatingText;
        final HSTextView csatMessageText;
        final AdminCSATBotView csatView;
        final HSButton newConversationButton;
        final HSButton sendFeedbackButton;

        public ViewHolder(View view) {
            super(view);
            this.csatView = (AdminCSATBotView) view.findViewById(R.id.admin_csat_view_layout);
            this.newConversationButton = (HSButton) view.findViewById(R.id.hs__csat_new_conversation_btn);
            HSButton hSButton = (HSButton) view.findViewById(R.id.csat_sendfeedback_btn);
            this.sendFeedbackButton = hSButton;
            this.csatMessageText = (HSTextView) view.findViewById(R.id.csat_bot_message);
            this.csatBotDislikeText = (HSTextView) view.findViewById(R.id.csat_bot_dislike_msg);
            this.csatBotLikedText = (HSTextView) view.findViewById(R.id.csat_bot_like_msg);
            this.csatBotSelectedRatingText = (HSTextView) view.findViewById(R.id.csat_selected_rating_msg);
            this.bottomDividerLayout = (LinearLayout) view.findViewById(R.id.csat_bottom_separator);
            setBorderToNewConversationButton(hSButton);
        }

        private void setBorderToNewConversationButton(Button button) {
            GradientDrawable gradientDrawable = (GradientDrawable) ContextCompat.getDrawable(AdminCSATMessageViewBinder.this.context, R.drawable.hs__button_with_border);
            if (gradientDrawable == null) {
                return;
            }
            gradientDrawable.setStroke((int) Styles.dpToPx(AdminCSATMessageViewBinder.this.context, 1.0f), Styles.getColor(AdminCSATMessageViewBinder.this.context, R.attr.colorAccent));
            gradientDrawable.setColor(Styles.getColor(AdminCSATMessageViewBinder.this.context, R.attr.hs__footerPromptBackground));
            int iDpToPx = (int) Styles.dpToPx(AdminCSATMessageViewBinder.this.context, 4.0f);
            int iDpToPx2 = (int) Styles.dpToPx(AdminCSATMessageViewBinder.this.context, 6.0f);
            InsetDrawable insetDrawable = new InsetDrawable((Drawable) gradientDrawable, iDpToPx, iDpToPx2, iDpToPx, iDpToPx2);
            if (Build.VERSION.SDK_INT >= 16) {
                button.setBackground(insetDrawable);
            } else {
                button.setBackgroundDrawable(insetDrawable);
            }
        }
    }
}

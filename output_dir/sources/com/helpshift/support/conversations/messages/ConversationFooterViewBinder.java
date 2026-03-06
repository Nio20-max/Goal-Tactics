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
import com.helpshift.conversation.activeconversation.message.ConversationFooterState;
import com.helpshift.support.widget.CSATView;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationFooterViewBinder {
    private Context context;
    ConversationFooterClickListener footerClickListener;

    public interface ConversationFooterClickListener {
        void onCSATSurveyCancelled();

        void onCSATSurveyStarted();

        void onCSATSurveySubmitted(int i, String str);

        void onStartNewConversationButtonClick();
    }

    public ConversationFooterViewBinder(Context context) {
        this.context = context;
    }

    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__messages_list_footer, viewGroup, false));
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.ConversationFooterViewBinder$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState;

        static {
            int[] iArr = new int[ConversationFooterState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState = iArr;
            try {
                iArr[ConversationFooterState.NONE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.CONVERSATION_ENDED_MESSAGE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.START_NEW_CONVERSATION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.CSAT_RATING.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.ARCHIVAL_MESSAGE.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.AUTHOR_MISMATCH.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.REJECTED_MESSAGE.ordinal()] = 7;
            } catch (NoSuchFieldError unused7) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[ConversationFooterState.REDACTED_STATE.ordinal()] = 8;
            } catch (NoSuchFieldError unused8) {
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void bind(ViewHolder viewHolder, ConversationFooterState conversationFooterState) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        String string = this.context.getResources().getString(R.string.hs__conversation_end_msg);
        boolean z6 = true;
        switch (AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState[conversationFooterState.ordinal()]) {
            case 1:
                z = false;
                z6 = false;
                z2 = false;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
            case 2:
                string = this.context.getResources().getString(R.string.hs__confirmation_footer_msg);
                z = true;
                z2 = false;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
            case 3:
                z = true;
                z2 = true;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
            case 4:
                string = this.context.getResources().getString(R.string.hs__confirmation_footer_msg);
                z = true;
                z2 = true;
                z3 = true;
                z4 = false;
                z5 = false;
                break;
            case 5:
                z = false;
                z2 = true;
                z3 = false;
                z4 = true;
                z5 = false;
                break;
            case 6:
                z = false;
                z2 = true;
                z3 = false;
                z4 = false;
                z5 = true;
                break;
            case 7:
                string = this.context.getResources().getString(R.string.hs__conversation_rejected_status);
                z = true;
                z2 = true;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
            case 8:
                z = false;
                z2 = true;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
            default:
                z = true;
                z2 = false;
                z3 = false;
                z4 = false;
                z5 = false;
                break;
        }
        if (z6) {
            viewHolder.conversationFooter.setVisibility(0);
            if (z) {
                viewHolder.footerMessage.setText(string);
                viewHolder.footerMessage.setVisibility(0);
            } else {
                viewHolder.footerMessage.setVisibility(8);
            }
            if (z2) {
                viewHolder.newConversationBox.setVisibility(0);
                viewHolder.newConversationButton.setOnClickListener(viewHolder);
            } else {
                viewHolder.newConversationBox.setVisibility(8);
                viewHolder.newConversationBox.setOnClickListener(null);
            }
            if (z3) {
                viewHolder.csatView.setVisibility(0);
                viewHolder.csatView.setCSATListener(viewHolder);
            } else {
                viewHolder.csatView.hideCSATDialog();
                viewHolder.csatView.setVisibility(8);
                viewHolder.csatView.setCSATListener(null);
            }
            if (z4) {
                viewHolder.newConversationReason.setVisibility(0);
                viewHolder.newConversationReason.setText(R.string.hs__issue_archival_message);
                return;
            } else if (z5) {
                viewHolder.newConversationReason.setVisibility(0);
                viewHolder.newConversationReason.setText(R.string.hs__new_conversation_footer_generic_reason);
                return;
            } else {
                viewHolder.newConversationReason.setVisibility(8);
                return;
            }
        }
        viewHolder.conversationFooter.setVisibility(8);
    }

    public void setConversationFooterClickListener(ConversationFooterClickListener conversationFooterClickListener) {
        this.footerClickListener = conversationFooterClickListener;
    }

    public final class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener, CSATView.CSATListener {
        final View conversationFooter;
        final CSATView csatView;
        final TextView footerMessage;
        final LinearLayout newConversationBox;
        final Button newConversationButton;
        final TextView newConversationReason;

        public ViewHolder(View view) {
            super(view);
            this.conversationFooter = view;
            this.footerMessage = (TextView) view.findViewById(R.id.footer_message);
            this.newConversationBox = (LinearLayout) view.findViewById(R.id.hs__new_conversation);
            this.newConversationButton = (Button) view.findViewById(R.id.hs__new_conversation_btn);
            this.csatView = (CSATView) view.findViewById(R.id.csat_view_layout);
            this.newConversationReason = (TextView) view.findViewById(R.id.hs__new_conversation_footer_reason);
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (ConversationFooterViewBinder.this.footerClickListener != null) {
                ConversationFooterViewBinder.this.footerClickListener.onStartNewConversationButtonClick();
            }
        }

        @Override // com.helpshift.support.widget.CSATView.CSATListener
        public void onCSATSurveyStarted() {
            if (ConversationFooterViewBinder.this.footerClickListener != null) {
                ConversationFooterViewBinder.this.footerClickListener.onCSATSurveyStarted();
            }
        }

        @Override // com.helpshift.support.widget.CSATView.CSATListener
        public void onCSATSurveyCancelled() {
            if (ConversationFooterViewBinder.this.footerClickListener != null) {
                ConversationFooterViewBinder.this.footerClickListener.onCSATSurveyCancelled();
            }
        }

        @Override // com.helpshift.support.widget.CSATView.CSATListener
        public void sendCSATSurvey(int i, String str) {
            if (ConversationFooterViewBinder.this.footerClickListener != null) {
                ConversationFooterViewBinder.this.footerClickListener.onCSATSurveySubmitted(i, str);
            }
        }
    }
}

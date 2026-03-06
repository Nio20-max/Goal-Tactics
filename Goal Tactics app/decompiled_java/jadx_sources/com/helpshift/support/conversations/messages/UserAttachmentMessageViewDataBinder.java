package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.UIViewState;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.support.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class UserAttachmentMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, UserAttachmentMessageDM> {
    public UserAttachmentMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_user_attachment_generic, viewGroup, false));
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, final UserAttachmentMessageDM userAttachmentMessageDM) {
        String str;
        float f;
        ViewHolder viewHolder2;
        boolean z;
        boolean z2;
        boolean z3;
        String string;
        String string2;
        String string3;
        String string4;
        View.OnClickListener onClickListener;
        int color = Styles.getColor(this.context, android.R.attr.textColorPrimary);
        int color2 = Styles.getColor(this.context, android.R.attr.textColorSecondary);
        String formattedFileSize = userAttachmentMessageDM.getFormattedFileSize();
        String subText = userAttachmentMessageDM.getSubText();
        String string5 = "";
        boolean z4 = false;
        boolean z5 = true;
        switch (AnonymousClass2.$SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[userAttachmentMessageDM.state.ordinal()]) {
            case 1:
                formattedFileSize = userAttachmentMessageDM.getFormattedFileSize();
                subText = this.context.getResources().getString(R.string.hs__sending_msg);
                str = "";
                f = 0.5f;
                viewHolder2 = null;
                z = true;
                z5 = false;
                z2 = false;
                z3 = false;
                string5 = this.context.getString(R.string.hs__user_sending_message_voice_over);
                string = str;
                break;
            case 2:
                color = Styles.getColor(this.context, R.attr.colorAccent);
                string2 = this.context.getString(R.string.hs__user_sent_message_voice_over, userAttachmentMessageDM.getAccessbilityMessageTime());
                string3 = this.context.getString(R.string.hs__attachment_downloaded__voice_over, userAttachmentMessageDM.fileName);
                str = "";
                viewHolder2 = null;
                z = false;
                z2 = false;
                z3 = true;
                string5 = string2;
                string = string3;
                f = 1.0f;
                break;
            case 3:
                subText = this.context.getResources().getString(R.string.hs__sending_fail_msg);
                color2 = Styles.getColor(this.context, R.attr.hs__errorTextColor);
                string5 = this.context.getString(R.string.hs__user_failed_message_voice_over);
                String string6 = this.context.getString(R.string.hs__retry_button_voice_over);
                viewHolder2 = viewHolder;
                str = string6;
                string = this.context.getString(R.string.hs__attachment_name_voice_over, userAttachmentMessageDM.fileName, userAttachmentMessageDM.getFormattedFileSize());
                f = 0.5f;
                z = false;
                z2 = true;
                z3 = false;
                break;
            case 4:
                if (userAttachmentMessageDM.isRejected) {
                    string4 = this.context.getString(R.string.hs__file_type_unsupported);
                } else {
                    string4 = this.context.getResources().getString(R.string.hs__sending_fail_msg);
                }
                subText = string4;
                color2 = Styles.getColor(this.context, R.attr.hs__errorTextColor);
                String string7 = this.context.getString(R.string.hs__user_attachment_rejected_voice_over);
                str = "";
                viewHolder2 = null;
                z = false;
                z2 = false;
                z3 = false;
                string5 = string7;
                string = this.context.getString(R.string.hs__attachment_name_voice_over, userAttachmentMessageDM.fileName, userAttachmentMessageDM.getFormattedFileSize());
                f = 0.5f;
                break;
            case 5:
                string2 = this.context.getString(R.string.hs__user_sent_message_voice_over, userAttachmentMessageDM.getAccessbilityMessageTime());
                string3 = this.context.getString(R.string.hs__attachment_not_downloaded_voice_over, userAttachmentMessageDM.fileName, userAttachmentMessageDM.getFormattedFileSize());
                str = "";
                viewHolder2 = null;
                z = false;
                z4 = true;
                z5 = false;
                z2 = false;
                z3 = true;
                string5 = string2;
                string = string3;
                f = 1.0f;
                break;
            case 6:
                formattedFileSize = userAttachmentMessageDM.getProgressAndFileSize();
                string2 = this.context.getString(R.string.hs__user_sent_message_voice_over, userAttachmentMessageDM.getAccessbilityMessageTime());
                string3 = this.context.getString(R.string.hs__attachment_downloading_voice_over, userAttachmentMessageDM.fileName, userAttachmentMessageDM.getProgressAndFileSize(), userAttachmentMessageDM.getFormattedFileSize());
                str = "";
                viewHolder2 = null;
                z = true;
                z5 = false;
                z2 = false;
                z3 = false;
                string5 = string2;
                string = string3;
                f = 1.0f;
                break;
            default:
                string = "";
                str = string;
                f = 0.5f;
                viewHolder2 = null;
                z = false;
                z5 = false;
                z2 = false;
                z3 = false;
                break;
        }
        UIViewState uiViewState = userAttachmentMessageDM.getUiViewState();
        String str2 = string;
        setViewVisibility(viewHolder.downloadButton, z4);
        setViewVisibility(viewHolder.attachmentIcon, z5);
        setViewVisibility(viewHolder.progress, z);
        setViewVisibility(viewHolder.retryButton, z2);
        setViewVisibility(viewHolder.subText, uiViewState.isFooterVisible());
        viewHolder.messageLayout.setAlpha(f);
        viewHolder.fileName.setText(userAttachmentMessageDM.fileName);
        viewHolder.fileSize.setText(formattedFileSize);
        viewHolder.fileName.setTextColor(color);
        if (uiViewState.isFooterVisible()) {
            viewHolder.subText.setText(subText);
            viewHolder.subText.setTextColor(color2);
        }
        if (z2) {
            viewHolder.retryButton.setOnClickListener(viewHolder2);
            onClickListener = null;
        } else {
            onClickListener = null;
            viewHolder.retryButton.setOnClickListener(null);
        }
        if (z3) {
            viewHolder.messageLayout.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.messages.UserAttachmentMessageViewDataBinder.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    UserAttachmentMessageViewDataBinder.this.messageClickListener.onUserAttachmentMessageClicked(userAttachmentMessageDM);
                }
            });
        } else {
            viewHolder.messageLayout.setOnClickListener(onClickListener);
        }
        viewHolder.messageContainer.setContentDescription(string5);
        viewHolder.messageLayout.setContentDescription(str2);
        viewHolder.retryButton.setContentDescription(str);
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.UserAttachmentMessageViewDataBinder$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState;

        static {
            int[] iArr = new int[UserAttachmentMessageDM.UserGenericAttachmentState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState = iArr;
            try {
                iArr[UserAttachmentMessageDM.UserGenericAttachmentState.SENDING.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[UserAttachmentMessageDM.UserGenericAttachmentState.SENT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[UserAttachmentMessageDM.UserGenericAttachmentState.UNSENT_RETRYABLE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[UserAttachmentMessageDM.UserGenericAttachmentState.UNSENT_NOT_RETRYABLE.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[UserAttachmentMessageDM.UserGenericAttachmentState.DOWNLOAD_NOT_STARTED.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserAttachmentMessageDM$UserGenericAttachmentState[UserAttachmentMessageDM.UserGenericAttachmentState.DOWNLOADING.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        final ImageView attachmentIcon;
        final View downloadButton;
        final TextView fileName;
        final TextView fileSize;
        final View messageContainer;
        final View messageLayout;
        final ProgressBar progress;
        final ImageView retryButton;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.user_attachment_message_layout);
            this.messageContainer = view.findViewById(R.id.user_attachment_container);
            this.fileName = (TextView) view.findViewById(R.id.attachment_file_name);
            this.fileSize = (TextView) view.findViewById(R.id.attachment_file_size);
            this.downloadButton = view.findViewById(R.id.download_button);
            ProgressBar progressBar = (ProgressBar) view.findViewById(R.id.progress);
            this.progress = progressBar;
            ImageView imageView = (ImageView) view.findViewById(R.id.attachment_icon);
            this.attachmentIcon = imageView;
            this.subText = (TextView) view.findViewById(R.id.date);
            this.retryButton = (ImageView) view.findViewById(R.id.user_message_retry_button);
            com.helpshift.util.Styles.setColorFilter(UserAttachmentMessageViewDataBinder.this.context, ((ImageView) view.findViewById(R.id.hs_download_foreground_view)).getDrawable(), R.attr.hs__chatBubbleMediaBackgroundColor);
            Styles.setAccentColor(UserAttachmentMessageViewDataBinder.this.context, progressBar.getIndeterminateDrawable());
            Styles.setAccentColor(UserAttachmentMessageViewDataBinder.this.context, imageView.getDrawable());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (UserAttachmentMessageViewDataBinder.this.messageClickListener != null) {
                UserAttachmentMessageViewDataBinder.this.messageClickListener.retryMessage(getAdapterPosition());
            }
        }
    }
}

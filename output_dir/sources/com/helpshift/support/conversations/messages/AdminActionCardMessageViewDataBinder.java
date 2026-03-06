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
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;

/* JADX INFO: loaded from: classes2.dex */
public class AdminActionCardMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, AdminActionCardMessageDM> {
    public AdminActionCardMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_admin_action_card, viewGroup, false));
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:19:? A[RETURN, SYNTHETIC] */
    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder.ViewHolder r9, final com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM r10) {
        /*
            r8 = this;
            boolean r0 = r10.isActionCardTitleVisible()
            android.widget.ImageView r1 = r9.actionCardImage
            int r2 = com.helpshift.R.drawable.hs__placeholder_image
            r1.setImageResource(r2)
            int[] r1 = com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder.AnonymousClass2.$SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState
            com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM$ActionCardImageState r2 = r10.state
            int r2 = r2.ordinal()
            r1 = r1[r2]
            r2 = 0
            r3 = 1
            if (r1 == r3) goto L23
            r4 = 2
            if (r1 == r4) goto L3c
            r4 = 3
            if (r1 == r4) goto L21
        L1f:
            r3 = 0
            goto L3e
        L21:
            r2 = 1
            goto L3e
        L23:
            com.helpshift.support.imageloader.ImageLoader r1 = com.helpshift.support.imageloader.ImageLoader.getInstance()
            com.helpshift.conversation.activeconversation.model.ActionCard r4 = r10.actionCard
            java.lang.String r4 = r4.filePath
            android.widget.ImageView r5 = r9.actionCardImage
            android.content.Context r6 = r8.context
            android.content.res.Resources r6 = r6.getResources()
            int r7 = com.helpshift.R.drawable.hs__placeholder_image
            android.graphics.drawable.Drawable r6 = r6.getDrawable(r7)
            r1.load(r4, r5, r6)
        L3c:
            r2 = 1
            goto L1f
        L3e:
            android.view.View r1 = r9.imageViewContainer
            r8.setViewVisibility(r1, r2)
            android.widget.TextView r1 = r9.actionTitle
            r8.setViewVisibility(r1, r0)
            android.view.View r1 = r9.separator
            r8.setViewVisibility(r1, r0)
            android.widget.ProgressBar r1 = r9.progress
            r8.setViewVisibility(r1, r3)
            android.widget.TextView r1 = r9.actionButton
            com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder$1 r2 = new com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder$1
            r2.<init>()
            r1.setOnClickListener(r2)
            if (r0 == 0) goto L70
            android.widget.TextView r0 = r9.actionTitle
            com.helpshift.conversation.activeconversation.model.ActionCard r1 = r10.actionCard
            java.lang.String r1 = r1.title
            r0.setText(r1)
            android.widget.TextView r0 = r9.actionTitle
            com.helpshift.conversation.activeconversation.model.ActionCard r1 = r10.actionCard
            java.lang.String r1 = r1.title
            r0.setContentDescription(r1)
        L70:
            com.helpshift.conversation.activeconversation.message.UIViewState r0 = r10.getUiViewState()
            android.widget.TextView r1 = r9.dateText
            java.lang.String r2 = r10.getSubText()
            r8.setAdminMessageSubText(r1, r0, r2)
            android.widget.TextView r0 = r9.actionButton
            com.helpshift.conversation.activeconversation.model.ActionCard r1 = r10.actionCard
            com.helpshift.conversation.activeconversation.model.Action r1 = r1.action
            java.lang.String r1 = r1.actionTitle
            r0.setText(r1)
            android.widget.TextView r0 = r9.actionButton
            com.helpshift.conversation.activeconversation.model.ActionCard r1 = r10.actionCard
            com.helpshift.conversation.activeconversation.model.Action r1 = r1.action
            java.lang.String r1 = r1.actionTitle
            r0.setContentDescription(r1)
            android.view.View r0 = r9.messageContainer
            java.lang.String r1 = r8.getAdminMessageContentDesciption(r10)
            r0.setContentDescription(r1)
            boolean r10 = r10.shouldShowAvatar()
            if (r10 == 0) goto Lab
            android.view.View r9 = r9.actionCardView
            android.view.ViewGroup$LayoutParams r9 = r9.getLayoutParams()
            r8.setAdminMessageLayoutMarginForAvatar(r9)
        Lab:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder.bind(com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM):void");
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.AdminActionCardMessageViewDataBinder$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState;

        static {
            int[] iArr = new int[AdminActionCardMessageDM.ActionCardImageState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState = iArr;
            try {
                iArr[AdminActionCardMessageDM.ActionCardImageState.IMAGE_DOWNLOADED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState[AdminActionCardMessageDM.ActionCardImageState.DOWNLOAD_NOT_STARTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState[AdminActionCardMessageDM.ActionCardImageState.IMAGE_DOWNLOADING.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final TextView actionButton;
        final ImageView actionCardImage;
        final View actionCardView;
        final TextView actionTitle;
        final TextView dateText;
        final View imageViewContainer;
        final View messageContainer;
        final ProgressBar progress;
        final View separator;

        ViewHolder(View view) {
            super(view);
            this.actionTitle = (TextView) view.findViewById(R.id.action_card_title);
            this.dateText = (TextView) view.findViewById(R.id.admin_date_text);
            this.actionButton = (TextView) view.findViewById(R.id.action_card_action);
            this.progress = (ProgressBar) view.findViewById(R.id.download_progressbar);
            this.actionCardImage = (ImageView) view.findViewById(R.id.action_card_imageview);
            this.imageViewContainer = view.findViewById(R.id.action_card_imageview_container);
            this.separator = view.findViewById(R.id.action_card_separator);
            this.messageContainer = view.findViewById(R.id.action_card_container);
            this.actionCardView = view.findViewById(R.id.action_card_cardview);
        }
    }
}

package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.animation.CollapseViewAnimation;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.support.conversations.messages.MessageViewDataBinder;
import com.helpshift.support.util.Styles;
import com.helpshift.support.views.HSAdjustableSelectOptionsViewInflater;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class UserSelectableOptionViewDataBinder extends MessageViewDataBinder<ViewHolder, OptionInputMessageDM> {
    UserSelectableOptionViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.hs__msg_user_selectable_options_container, viewGroup, false));
        viewHolder.setIsRecyclable(false);
        return viewHolder;
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public void bind(ViewHolder viewHolder, OptionInputMessageDM optionInputMessageDM) {
        viewHolder.optionsContainer.removeAllViews();
        if (!StringUtils.isEmpty(optionInputMessageDM.input.inputLabel)) {
            viewHolder.optionsHeaderTextView.setVisibility(0);
            viewHolder.optionsHeaderTextView.setText(optionInputMessageDM.input.inputLabel);
        } else {
            viewHolder.optionsHeaderTextView.setVisibility(8);
        }
        new HSAdjustableSelectOptionsViewInflater(this.context, Styles.isTablet(this.context) ? 0.6000000000000001d : 0.8d, (int) this.context.getResources().getDimension(R.dimen.activity_horizontal_margin_medium), viewHolder.optionsContainer, R.layout.hs__msg_user_selectable_option, R.id.selectable_option_text, R.drawable.hs__pill, R.attr.hs__selectableOptionColor, optionInputMessageDM.input.options, new OnOptionSelectedListener(viewHolder, this.messageClickListener, optionInputMessageDM, false)).inflate();
        if (!optionInputMessageDM.input.required && !StringUtils.isEmpty(optionInputMessageDM.input.skipLabel)) {
            int paddingLeft = viewHolder.optionsSkipTextView.getPaddingLeft();
            int paddingTop = viewHolder.optionsSkipTextView.getPaddingTop();
            int paddingRight = viewHolder.optionsSkipTextView.getPaddingRight();
            int paddingBottom = viewHolder.optionsSkipTextView.getPaddingBottom();
            setDrawable(viewHolder.optionsSkipTextView, R.drawable.hs__pill_small, R.attr.hs__selectableOptionColor);
            viewHolder.optionsSkipTextView.setPadding(paddingLeft, paddingTop, paddingRight, paddingBottom);
            viewHolder.optionsSkipTextView.setText(optionInputMessageDM.input.skipLabel);
            viewHolder.optionsSkipTextView.setVisibility(0);
            viewHolder.optionsSkipTextView.setOnClickListener(new OnOptionSelectedListener(viewHolder, this.messageClickListener, optionInputMessageDM, true));
            return;
        }
        viewHolder.optionsSkipTextView.setVisibility(8);
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final LinearLayout optionsContainer;
        final TextView optionsHeaderTextView;
        final LinearLayout optionsMessageView;
        final TextView optionsSkipTextView;

        ViewHolder(View view) {
            super(view);
            this.optionsMessageView = (LinearLayout) view.findViewById(R.id.options_message_view);
            this.optionsContainer = (LinearLayout) view.findViewById(R.id.selectable_options_container);
            this.optionsHeaderTextView = (TextView) view.findViewById(R.id.options_header);
            this.optionsSkipTextView = (TextView) view.findViewById(R.id.selectable_option_skip);
        }
    }

    private final class OnOptionSelectedListener implements View.OnClickListener {
        final boolean isSkip;
        final OptionInputMessageDM message;
        final MessageViewDataBinder.MessageItemClickListener messageClickListener;
        final ViewHolder viewHolder;

        OnOptionSelectedListener(ViewHolder viewHolder, MessageViewDataBinder.MessageItemClickListener messageItemClickListener, OptionInputMessageDM optionInputMessageDM, boolean z) {
            this.viewHolder = viewHolder;
            this.messageClickListener = messageItemClickListener;
            this.message = optionInputMessageDM;
            this.isSkip = z;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            final TextView textView = (TextView) view;
            CollapseViewAnimation collapseViewAnimation = new CollapseViewAnimation(this.viewHolder.optionsMessageView);
            long j = 250;
            collapseViewAnimation.setDuration(j);
            collapseViewAnimation.setFillAfter(true);
            AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
            alphaAnimation.setDuration(j);
            alphaAnimation.setFillAfter(true);
            AnimationSet animationSet = new AnimationSet(true);
            animationSet.addAnimation(alphaAnimation);
            animationSet.addAnimation(collapseViewAnimation);
            animationSet.setAnimationListener(new Animation.AnimationListener() { // from class: com.helpshift.support.conversations.messages.UserSelectableOptionViewDataBinder.OnOptionSelectedListener.1
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    OnOptionSelectedListener.this.viewHolder.optionsMessageView.setVisibility(8);
                    if (OnOptionSelectedListener.this.messageClickListener != null) {
                        OnOptionSelectedListener.this.messageClickListener.handleOptionSelected(OnOptionSelectedListener.this.message, (OptionInput.Option) textView.getTag(), OnOptionSelectedListener.this.isSkip);
                    }
                }
            });
            this.viewHolder.optionsMessageView.startAnimation(animationSet);
        }
    }
}

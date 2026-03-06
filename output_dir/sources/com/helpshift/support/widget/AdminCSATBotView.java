package com.helpshift.support.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import com.helpshift.R;
import com.helpshift.support.util.Styles;
import com.helpshift.views.HSButton;

/* JADX INFO: loaded from: classes2.dex */
public class AdminCSATBotView extends RelativeLayout implements RatingBar.OnRatingBarChangeListener {
    private AdminCSATBotViewListener adminCSATBotListener;
    private RatingBar ratingBar;
    private HSButton sendFeedbackButton;

    public interface AdminCSATBotViewListener {
        void onCSATSurveyRequested();

        void onRatingChanged(int i);

        void sendCSATSurvey(int i);
    }

    public AdminCSATBotView(Context context) {
        super(context);
        this.adminCSATBotListener = null;
        initView(context);
    }

    public AdminCSATBotView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.adminCSATBotListener = null;
        initView(context);
    }

    public AdminCSATBotView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.adminCSATBotListener = null;
        initView(context);
    }

    private void initView(Context context) {
        View.inflate(context, R.layout.hs__csat_bot_view, this);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.ratingBar = (RatingBar) findViewById(R.id.ratingBar);
        this.sendFeedbackButton = (HSButton) findViewById(R.id.csat_sendfeedback_btn);
        Styles.setAccentColor(getContext(), this.ratingBar.getProgressDrawable());
        this.ratingBar.setOnRatingBarChangeListener(this);
        this.sendFeedbackButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.widget.AdminCSATBotView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AdminCSATBotView.this.adminCSATBotListener != null) {
                    AdminCSATBotView.this.adminCSATBotListener.sendCSATSurvey(Math.round(AdminCSATBotView.this.ratingBar.getRating()));
                }
            }
        });
    }

    @Override // android.widget.RatingBar.OnRatingBarChangeListener
    public void onRatingChanged(RatingBar ratingBar, float f, boolean z) {
        if (!z || this.adminCSATBotListener == null) {
            return;
        }
        int iRound = Math.round(f);
        if (iRound < 1) {
            ratingBar.setRating(1.0f);
            iRound = 1;
        }
        this.adminCSATBotListener.onRatingChanged(iRound);
    }

    public void setAdminCSATBotListener(AdminCSATBotViewListener adminCSATBotViewListener) {
        this.adminCSATBotListener = adminCSATBotViewListener;
        adminCSATBotViewListener.onCSATSurveyRequested();
    }

    public void reset() {
        this.sendFeedbackButton.setVisibility(8);
        this.ratingBar.setRating(0.0f);
    }
}

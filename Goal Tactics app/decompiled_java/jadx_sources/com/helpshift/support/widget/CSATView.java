package com.helpshift.support.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.RatingBar;
import android.widget.RelativeLayout;
import com.helpshift.R;
import com.helpshift.support.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class CSATView extends RelativeLayout implements RatingBar.OnRatingBarChangeListener {
    private CSATDialog csatDialog;
    private CSATListener csatListener;
    private RatingBar ratingBar;

    public interface CSATListener {
        void onCSATSurveyCancelled();

        void onCSATSurveyStarted();

        void sendCSATSurvey(int i, String str);
    }

    public CSATView(Context context) {
        super(context);
        this.csatListener = null;
        initView(context);
    }

    public CSATView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.csatListener = null;
        initView(context);
    }

    public CSATView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.csatListener = null;
        initView(context);
    }

    private void initView(Context context) {
        View.inflate(context, R.layout.hs__csat_view, this);
        this.csatDialog = new CSATDialog(context);
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.ratingBar = (RatingBar) findViewById(R.id.ratingBar);
        Styles.setAccentColor(getContext(), this.ratingBar.getProgressDrawable());
        this.ratingBar.setOnRatingBarChangeListener(this);
    }

    @Override // android.widget.RatingBar.OnRatingBarChangeListener
    public void onRatingChanged(RatingBar ratingBar, float f, boolean z) {
        if (z) {
            this.csatDialog.show(this);
        }
    }

    public void hideCSATDialog() {
        CSATDialog cSATDialog = this.csatDialog;
        if (cSATDialog == null || !cSATDialog.isShowing()) {
            return;
        }
        this.csatDialog.dismiss();
    }

    protected RatingBar getRatingBar() {
        return this.ratingBar;
    }

    protected void dismiss() {
        setVisibility(8);
        this.csatDialog = null;
    }

    protected void sendCSATSurvey(float f, String str) {
        CSATListener cSATListener = this.csatListener;
        if (cSATListener != null) {
            cSATListener.sendCSATSurvey(Math.round(f), str);
        }
    }

    protected void onCSATSurveyStarted() {
        CSATListener cSATListener = this.csatListener;
        if (cSATListener != null) {
            cSATListener.onCSATSurveyStarted();
        }
    }

    protected void onCSATSurveyCancelled() {
        CSATListener cSATListener = this.csatListener;
        if (cSATListener != null) {
            cSATListener.onCSATSurveyCancelled();
        }
    }

    public void setCSATListener(CSATListener cSATListener) {
        this.csatListener = cSATListener;
    }
}

package com.helpshift.support.widget;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RatingBar;
import android.widget.TextView;
import com.helpshift.R;
import com.helpshift.support.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
public class CSATDialog extends Dialog implements DialogInterface.OnShowListener, DialogInterface.OnDismissListener, View.OnClickListener, RatingBar.OnRatingBarChangeListener {
    private EditText addtionalFeedback;
    private Context context;
    private CSATView csatView;
    private RatingBar dialogRatingBar;
    private TextView likeStatus;
    private float rating;
    private boolean submitted;

    public CSATDialog(Context context) {
        super(context);
        this.submitted = false;
        this.context = context;
    }

    @Override // android.app.Dialog
    protected void onCreate(Bundle bundle) {
        requestWindowFeature(1);
        super.onCreate(bundle);
        setContentView(R.layout.hs__csat_dialog);
        setOnShowListener(this);
        setOnDismissListener(this);
        this.dialogRatingBar = (RatingBar) findViewById(R.id.ratingBar);
        Styles.setAccentColor(getContext(), this.dialogRatingBar.getProgressDrawable());
        this.dialogRatingBar.setOnRatingBarChangeListener(this);
        this.likeStatus = (TextView) findViewById(R.id.like_status);
        this.addtionalFeedback = (EditText) findViewById(R.id.additional_feedback);
        ((Button) findViewById(R.id.submit)).setOnClickListener(this);
    }

    @Override // android.content.DialogInterface.OnShowListener
    public void onShow(DialogInterface dialogInterface) {
        setDialogRatingAndDescription(this.rating);
        this.csatView.onCSATSurveyStarted();
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        if (this.submitted) {
            this.csatView.dismiss();
        } else {
            this.csatView.getRatingBar().setRating(0.0f);
            this.csatView.onCSATSurveyCancelled();
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (view.getId() == R.id.submit) {
            this.csatView.sendCSATSurvey(this.dialogRatingBar.getRating(), this.addtionalFeedback.getText().toString());
            this.submitted = true;
            dismiss();
        }
    }

    protected void show(CSATView cSATView) {
        this.csatView = cSATView;
        this.rating = cSATView.getRatingBar().getRating();
        show();
    }

    @Override // android.widget.RatingBar.OnRatingBarChangeListener
    public void onRatingChanged(RatingBar ratingBar, float f, boolean z) {
        if (z) {
            if (f < 1.0f) {
                f = 1.0f;
            }
            setDialogRatingAndDescription(f);
        }
    }

    private void setDialogRatingAndDescription(float f) {
        this.dialogRatingBar.setRating(f);
        double d = f;
        if (d > 4.0d) {
            this.likeStatus.setText(R.string.hs__csat_like_message);
        } else if (d > 3.0d) {
            this.likeStatus.setText(R.string.hs__csat_liked_rating_message);
        } else if (d > 2.0d) {
            this.likeStatus.setText(R.string.hs__csat_ok_rating_message);
        } else if (d > 1.0d) {
            this.likeStatus.setText(R.string.hs__csat_disliked_rating_message);
        } else {
            this.likeStatus.setText(R.string.hs__csat_dislike_message);
        }
        int i = (int) f;
        this.dialogRatingBar.setContentDescription(this.context.getResources().getQuantityString(R.plurals.hs__csat_rating_value, i, Integer.valueOf(i)));
    }
}

package com.helpshift.support.fragments;

import android.R;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.F;
import com.helpshift.support.ContactUsFilter;
import com.helpshift.support.Faq;
import com.helpshift.support.HSApiData;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.controllers.SupportController;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.support.webkit.CustomWebChromeClient;
import com.helpshift.support.webkit.CustomWebView;
import com.helpshift.support.webkit.CustomWebViewClient;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftConnectionUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import com.helpshift.util.Styles;
import com.helpshift.views.FontApplier;
import com.ironsource.sdk.constants.Events;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class SingleQuestionFragment extends MainFragment implements View.OnClickListener, CustomWebViewClient.CustomWebViewClientListeners {
    public static final String BUNDLE_ARG_QUESTION_LANGUAGE = "questionLanguage";
    public static final String BUNDLE_ARG_QUESTION_PUBLISH_ID = "questionPublishId";
    public static final String BUNDLE_ARG_QUESTION_SOURCE = "questionSource";
    private static final String JS_inlineScriptTag = "javascript:";
    private static final String JS_scriptTag = "<script";
    private static final String TAG = "Helpshift_SingleQstn";
    private Button contactUsButton;
    private HSApiData data;
    private boolean decomp;
    boolean eventSent;
    private Faq highlightedQuestion;
    private boolean isHighlighted;
    private Button noButton;
    private View progressBar;
    private Faq question;
    private View questionFooter;
    private TextView questionFooterMessage;
    private String questionPublishId;
    private QuestionReadListener questionReadListener;
    private String questionSource;
    private SupportController supportController;
    private String textColor;
    private String textColorLink;
    private CustomWebView webView;
    private Button yesButton;
    private int singleQuestionMode = 1;
    private int isHelpful = 0;
    private boolean showRootLayoutInsideCardView = false;

    public interface QuestionReadListener {
        void onQuestionRead(String str);
    }

    public static class SingleQuestionModes {
        public static final int ADMIN_SUGGESTED = 3;
        public static final int DONE = 2;
        public static final int STANDARD = 1;
    }

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static SingleQuestionFragment newInstance(Bundle bundle, int i, boolean z, QuestionReadListener questionReadListener) {
        SingleQuestionFragment singleQuestionFragment = new SingleQuestionFragment();
        singleQuestionFragment.setArguments(bundle);
        singleQuestionFragment.singleQuestionMode = i;
        singleQuestionFragment.showRootLayoutInsideCardView = z;
        singleQuestionFragment.questionReadListener = questionReadListener;
        return singleQuestionFragment;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
            this.data = new HSApiData(context);
            SupportFragment supportFragment = FragmentUtil.getSupportFragment(this);
            if (supportFragment != null) {
                this.supportController = supportFragment.getSupportController();
            }
            this.fragmentName = getClass().getName() + this.singleQuestionMode;
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in SingleQuestionFragment.onAttach()", e);
        }
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        if (isChangingConfigurations()) {
            return;
        }
        this.eventSent = false;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        this.webView.onPause();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
    }

    private void getColorsFromTheme(Context context) {
        this.textColor = Styles.getHexColor(context, R.attr.textColorPrimary);
        this.textColorLink = Styles.getHexColor(context, com.helpshift.R.attr.hs__faqTextColorLink);
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.decomp = arguments.getBoolean(SupportFragmentConstants.DECOMPOSED, false);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        int i = com.helpshift.R.layout.hs__single_question_fragment;
        if (this.showRootLayoutInsideCardView) {
            i = com.helpshift.R.layout.hs__single_question_layout_with_cardview;
        }
        return layoutInflater.inflate(i, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        CustomWebView customWebView = (CustomWebView) view.findViewById(com.helpshift.R.id.web_view);
        this.webView = customWebView;
        customWebView.setBackgroundColor(0);
        this.webView.setWebViewClient(new CustomWebViewClient(HelpshiftContext.getApplicationContext(), this));
        this.webView.setWebChromeClient(new CustomWebChromeClient(getActivity().getWindow().getDecorView(), view.findViewById(com.helpshift.R.id.faq_content_view)));
        Button button = (Button) view.findViewById(com.helpshift.R.id.helpful_button);
        this.yesButton = button;
        button.setOnClickListener(this);
        Button button2 = (Button) view.findViewById(com.helpshift.R.id.unhelpful_button);
        this.noButton = button2;
        button2.setOnClickListener(this);
        this.questionFooter = view.findViewById(com.helpshift.R.id.question_footer);
        this.questionFooterMessage = (TextView) view.findViewById(com.helpshift.R.id.question_footer_message);
        Button button3 = (Button) view.findViewById(com.helpshift.R.id.contact_us_button);
        this.contactUsButton = button3;
        button3.setOnClickListener(this);
        if (Build.VERSION.SDK_INT >= 24) {
            this.yesButton.setText(com.helpshift.R.string.hs__mark_yes);
            this.noButton.setText(com.helpshift.R.string.hs__mark_no);
            this.contactUsButton.setText(com.helpshift.R.string.hs__contact_us_btn);
        }
        if (this.singleQuestionMode == 2) {
            this.contactUsButton.setText(getResources().getString(com.helpshift.R.string.hs__send_anyway));
        }
        Bundle arguments = getArguments();
        this.questionSource = arguments.getString(BUNDLE_ARG_QUESTION_SOURCE);
        this.questionPublishId = arguments.getString(BUNDLE_ARG_QUESTION_PUBLISH_ID);
        int i = arguments.getInt(SupportFragment.SUPPORT_MODE);
        String string = arguments.getString(BUNDLE_ARG_QUESTION_LANGUAGE, "");
        boolean z = this.singleQuestionMode == 3;
        this.data.getQuestion(new Success(this), new Failure(this), z || i == 3, z, this.questionPublishId, string);
        this.progressBar = view.findViewById(com.helpshift.R.id.progress_bar);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        if (isScreenLarge()) {
            Fragment parentFragment = getParentFragment();
            if (parentFragment instanceof FaqFlowFragment) {
                ((FaqFlowFragment) parentFragment).updateSelectQuestionUI(false);
            }
        }
        this.webView.onResume();
        if (this.decomp || !isScreenLarge()) {
            setToolbarTitle(getString(com.helpshift.R.string.hs__question_header));
        }
        Faq faq = this.question;
        if (faq == null || TextUtils.isEmpty(faq.getId()) || this.eventSent) {
            return;
        }
        reportReadFaqEvent();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        SnackbarUtil.hideSnackbar(getView());
        this.questionFooter = null;
        this.webView.setWebViewClient(null);
        this.webView = null;
        this.noButton = null;
        this.yesButton = null;
        this.contactUsButton = null;
        super.onDestroyView();
    }

    void setQuestion(Faq faq) {
        this.question = faq;
        if (this.webView != null) {
            getColorsFromTheme(getContext());
            this.webView.loadDataWithBaseURL(null, getStyledBody(faq), "text/html", Events.CHARSET_FORMAT, null);
        }
    }

    private String getStyledBody(Faq faq) {
        String str;
        String str2;
        StringBuilder sb;
        String fontPath = FontApplier.getFontPath();
        if (TextUtils.isEmpty(fontPath)) {
            str = "";
            str2 = str;
        } else {
            str = "@font-face {    font-family: custom;    src: url('" + ("file:///android_asset/" + fontPath) + "');}";
            str2 = "font-family: custom, sans-serif;";
        }
        String strReplace = faq.body;
        String strReplace2 = faq.title;
        if (!TextUtils.isEmpty(strReplace)) {
            strReplace = strReplace.replace(JS_scriptTag, "").replace(JS_inlineScriptTag, "");
        }
        if (!TextUtils.isEmpty(strReplace2)) {
            strReplace2 = strReplace2.replace(JS_scriptTag, "").replace(JS_inlineScriptTag, "");
        }
        if (faq.is_rtl.booleanValue()) {
            sb = new StringBuilder("<html dir=\"rtl\">");
        } else {
            sb = new StringBuilder("<html>");
        }
        sb.append("<head>");
        sb.append("    <style type='text/css'>");
        sb.append(str);
        sb.append("        img,");
        sb.append("        object,");
        sb.append("        embed {");
        sb.append("            max-width: 100%;");
        sb.append("        }");
        sb.append("        a,");
        sb.append("        a:visited,");
        sb.append("        a:active,");
        sb.append("        a:hover {");
        sb.append("            color: ");
        sb.append(this.textColorLink);
        sb.append(";");
        sb.append("        }");
        sb.append("        body {");
        sb.append("            background-color: transparent;");
        sb.append("            margin: 0;");
        sb.append("            padding: ");
        sb.append("16px 16px 96px 16px;");
        sb.append("            font-size: ");
        sb.append("16px");
        sb.append(";");
        sb.append(str2);
        sb.append("            line-height: ");
        sb.append("1.5");
        sb.append(";");
        sb.append("            white-space: normal;");
        sb.append("            word-wrap: break-word;");
        sb.append("            color: ");
        sb.append(this.textColor);
        sb.append(";");
        sb.append("        }");
        sb.append("        .title {");
        sb.append("            display: block;");
        sb.append("            margin: 0;");
        sb.append("            padding: 0 0 ");
        sb.append(16);
        sb.append(" 0;");
        sb.append("            font-size: ");
        sb.append("24px");
        sb.append(";");
        sb.append(str2);
        sb.append("            line-height: ");
        sb.append("32px");
        sb.append(";");
        sb.append("        }");
        sb.append("        h1, h2, h3 { ");
        sb.append("            line-height: 1.4; ");
        sb.append("        }");
        sb.append("    </style>");
        sb.append("    <script language='javascript'>");
        sb.append("     window.onload = function () {");
        sb.append("        var w = window,");
        sb.append("            d = document,");
        sb.append("            e = d.documentElement,");
        sb.append("            g = d.getElementsByTagName('body')[0],");
        sb.append("            sWidth = Math.min (w.innerWidth || Infinity, e.clientWidth || Infinity, g.clientWidth || Infinity),");
        sb.append("            sHeight = Math.min (w.innerHeight || Infinity, e.clientHeight || Infinity, g.clientHeight || Infinity);");
        sb.append("        var frame, fw, fh;");
        sb.append("        var iframes = document.getElementsByTagName('iframe');");
        sb.append("        var padding = ");
        sb.append(32);
        sb.append(";");
        sb.append("        for (var i=0; i < iframes.length; i++) {");
        sb.append("            frame = iframes[i];");
        sb.append("            fw = frame.offsetWidth;");
        sb.append("            fh = frame.offsetHeight;");
        sb.append("            if (fw >= fh && fw > (sWidth - padding)) {");
        sb.append("                frame.style.width = sWidth - padding;");
        sb.append("                frame.style.height = ((sWidth - padding) * fh/fw).toString();");
        sb.append("            }");
        sb.append("        }");
        sb.append("        document.addEventListener('click', function (event) {");
        sb.append("            if (event.target instanceof HTMLImageElement) {");
        sb.append("                event.preventDefault();");
        sb.append("                event.stopPropagation();");
        sb.append("            }");
        sb.append("        }, false);");
        sb.append("    };");
        sb.append("    </script>");
        sb.append("</head>");
        sb.append("<body>");
        sb.append("    <strong class='title'> ");
        sb.append(strReplace2);
        sb.append(" </strong> ");
        sb.append(strReplace);
        sb.append("</body>");
        sb.append("</html>");
        return sb.toString();
    }

    private void markQuestion(boolean z) {
        Faq faq = this.question;
        if (faq == null) {
            return;
        }
        String id = faq.getId();
        this.data.markFaqInDB(id, z);
        HelpshiftContext.getCoreApi().getFaqDM().markHelpful(id, z);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        SupportFragment supportFragment;
        if (view.getId() == com.helpshift.R.id.helpful_button) {
            markQuestion(true);
            setIsHelpful(1);
            if (this.singleQuestionMode != 2 || (supportFragment = FragmentUtil.getSupportFragment(this)) == null) {
                return;
            }
            supportFragment.getSupportController().actionDone();
            return;
        }
        if (view.getId() == com.helpshift.R.id.unhelpful_button) {
            markQuestion(false);
            setIsHelpful(-1);
            return;
        }
        if (view.getId() != com.helpshift.R.id.contact_us_button || this.supportController == null) {
            return;
        }
        if (this.singleQuestionMode == 1) {
            FaqFragmentListener faqFlowListener = getFaqFlowListener();
            if (faqFlowListener != null) {
                faqFlowListener.onContactUsClicked(null);
                return;
            }
            return;
        }
        SupportFragment supportFragment2 = FragmentUtil.getSupportFragment(this);
        if (supportFragment2 != null) {
            supportFragment2.getSupportController().sendAnyway();
        }
    }

    public FaqFragmentListener getFaqFlowListener() {
        FaqFlowViewParent faqFlowViewParent = (FaqFlowViewParent) getParentFragment();
        if (faqFlowViewParent != null) {
            return faqFlowViewParent.getFaqFlowListener();
        }
        return null;
    }

    private void setIsHelpful(int i) {
        if (i != 0) {
            this.isHelpful = i;
        }
        updateFooter();
    }

    @Override // com.helpshift.support.webkit.CustomWebViewClient.CustomWebViewClientListeners
    public void onPageStarted() {
        showProgress(true);
    }

    @Override // com.helpshift.support.webkit.CustomWebViewClient.CustomWebViewClientListeners
    public void onPageFinished() {
        if (isVisible()) {
            showProgress(false);
            setIsHelpful(this.question.is_helpful);
            if (this.isHighlighted) {
                this.isHighlighted = false;
            } else {
                highlightAndReloadQuestion();
            }
        }
    }

    private void highlightAndReloadQuestion() {
        this.isHighlighted = true;
        final ArrayList<String> stringArrayList = getArguments().getStringArrayList("searchTerms");
        HelpshiftContext.getCoreApi().getDomain().runParallel(new F() { // from class: com.helpshift.support.fragments.SingleQuestionFragment.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                SingleQuestionFragment singleQuestionFragment = SingleQuestionFragment.this;
                singleQuestionFragment.highlightedQuestion = com.helpshift.support.util.Styles.getQuestionWithHighlightedSearchTerms(singleQuestionFragment.getContext(), SingleQuestionFragment.this.question, stringArrayList);
                HelpshiftContext.getCoreApi().getDomain().runOnUI(new F() { // from class: com.helpshift.support.fragments.SingleQuestionFragment.1.1
                    @Override // com.helpshift.common.domain.F
                    public void f() {
                        if (SingleQuestionFragment.this.highlightedQuestion != null) {
                            SingleQuestionFragment.this.setQuestion(SingleQuestionFragment.this.highlightedQuestion);
                        }
                    }
                });
            }
        });
    }

    private void showProgress(boolean z) {
        View view = this.progressBar;
        if (view != null) {
            if (z) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
        }
    }

    private void updateFooter() {
        if (this.singleQuestionMode == 3) {
            hideQuestionFooter();
            return;
        }
        int i = this.isHelpful;
        if (i == -1) {
            showUnhelpfulFooter();
        } else if (i == 0) {
            showQuestionFooter();
        } else {
            if (i != 1) {
                return;
            }
            showHelpfulFooter();
        }
    }

    private void hideQuestionFooter() {
        this.questionFooter.setVisibility(8);
    }

    private void showQuestionFooter() {
        this.questionFooter.setVisibility(0);
        this.questionFooterMessage.setText(getResources().getString(com.helpshift.R.string.hs__mark_yes_no_question));
        this.contactUsButton.setVisibility(8);
        this.yesButton.setVisibility(0);
        this.noButton.setVisibility(0);
    }

    private void showHelpfulFooter() {
        this.questionFooter.setVisibility(0);
        this.questionFooterMessage.setText(getResources().getString(com.helpshift.R.string.hs__question_helpful_message));
        this.questionFooterMessage.setGravity(17);
        this.contactUsButton.setVisibility(8);
        this.yesButton.setVisibility(8);
        this.noButton.setVisibility(8);
    }

    private void showUnhelpfulFooter() {
        this.questionFooter.setVisibility(0);
        this.questionFooterMessage.setText(getResources().getString(com.helpshift.R.string.hs__question_unhelpful_message));
        showQuestionFooterContactUs();
        this.yesButton.setVisibility(8);
        this.noButton.setVisibility(8);
    }

    private void showQuestionFooterContactUs() {
        if (ContactUsFilter.showContactUs(ContactUsFilter.LOCATION.QUESTION_FOOTER)) {
            this.contactUsButton.setVisibility(0);
        } else {
            this.contactUsButton.setVisibility(8);
        }
    }

    public String getQuestionId() {
        Faq faq = this.question;
        return faq != null ? faq.getId() : "";
    }

    public String getQuestionPublishId() {
        return this.questionPublishId;
    }

    void reportReadFaqEvent() {
        HashMap map = new HashMap();
        map.put("id", this.question.getId());
        map.put("nt", Boolean.valueOf(HelpshiftConnectionUtil.isOnline(getContext())));
        if (!StringUtils.isEmpty(this.questionSource)) {
            map.put(AnalyticsEventKey.FAQ_SOURCE, this.questionSource);
        }
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.READ_FAQ, map);
        QuestionReadListener questionReadListener = this.questionReadListener;
        if (questionReadListener != null) {
            questionReadListener.onQuestionRead(this.question.getId());
        }
        this.eventSent = true;
    }

    private static class Success extends Handler {
        private WeakReference<SingleQuestionFragment> singleQuestionFragmentWeakReference;

        public Success(SingleQuestionFragment singleQuestionFragment) {
            this.singleQuestionFragmentWeakReference = new WeakReference<>(singleQuestionFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            Faq faq;
            super.handleMessage(message);
            SingleQuestionFragment singleQuestionFragment = this.singleQuestionFragmentWeakReference.get();
            if (singleQuestionFragment == null || (faq = (Faq) message.obj) == null) {
                return;
            }
            singleQuestionFragment.setQuestion(faq);
            String id = faq.getId();
            HSLogger.d(SingleQuestionFragment.TAG, "FAQ question loaded : " + faq.title);
            if (singleQuestionFragment.eventSent || TextUtils.isEmpty(id)) {
                return;
            }
            singleQuestionFragment.reportReadFaqEvent();
        }
    }

    private static class Failure extends Handler {
        private WeakReference<SingleQuestionFragment> singleQuestionFragmentWeakReference;

        public Failure(SingleQuestionFragment singleQuestionFragment) {
            this.singleQuestionFragmentWeakReference = new WeakReference<>(singleQuestionFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            super.handleMessage(message);
            SingleQuestionFragment singleQuestionFragment = this.singleQuestionFragmentWeakReference.get();
            if (singleQuestionFragment == null || singleQuestionFragment.isDetached() || singleQuestionFragment.question != null) {
                return;
            }
            SnackbarUtil.showErrorSnackbar(102, singleQuestionFragment.getView());
        }
    }
}

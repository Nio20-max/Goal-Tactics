.class public Lcom/helpshift/support/fragments/SingleQuestionFragment;
.super Lcom/helpshift/support/fragments/MainFragment;
.source "SingleQuestionFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/helpshift/support/webkit/CustomWebViewClient$CustomWebViewClientListeners;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/fragments/SingleQuestionFragment$Failure;,
        Lcom/helpshift/support/fragments/SingleQuestionFragment$Success;,
        Lcom/helpshift/support/fragments/SingleQuestionFragment$SingleQuestionModes;,
        Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;
    }
.end annotation


# static fields
.field public static final BUNDLE_ARG_QUESTION_LANGUAGE:Ljava/lang/String; = "questionLanguage"

.field public static final BUNDLE_ARG_QUESTION_PUBLISH_ID:Ljava/lang/String; = "questionPublishId"

.field public static final BUNDLE_ARG_QUESTION_SOURCE:Ljava/lang/String; = "questionSource"

.field private static final JS_inlineScriptTag:Ljava/lang/String; = "javascript:"

.field private static final JS_scriptTag:Ljava/lang/String; = "<script"

.field private static final TAG:Ljava/lang/String; = "Helpshift_SingleQstn"


# instance fields
.field private contactUsButton:Landroid/widget/Button;

.field private data:Lcom/helpshift/support/HSApiData;

.field private decomp:Z

.field eventSent:Z

.field private highlightedQuestion:Lcom/helpshift/support/Faq;

.field private isHelpful:I

.field private isHighlighted:Z

.field private noButton:Landroid/widget/Button;

.field private progressBar:Landroid/view/View;

.field private question:Lcom/helpshift/support/Faq;

.field private questionFooter:Landroid/view/View;

.field private questionFooterMessage:Landroid/widget/TextView;

.field private questionPublishId:Ljava/lang/String;

.field private questionReadListener:Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;

.field private questionSource:Ljava/lang/String;

.field private showRootLayoutInsideCardView:Z

.field private singleQuestionMode:I

.field private supportController:Lcom/helpshift/support/controllers/SupportController;

.field private textColor:Ljava/lang/String;

.field private textColorLink:Ljava/lang/String;

.field private webView:Lcom/helpshift/support/webkit/CustomWebView;

.field private yesButton:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 51
    invoke-direct {p0}, Lcom/helpshift/support/fragments/MainFragment;-><init>()V

    const/4 v0, 0x1

    .line 65
    iput v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    const/4 v0, 0x0

    .line 80
    iput v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHelpful:I

    .line 81
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showRootLayoutInsideCardView:Z

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/fragments/SingleQuestionFragment;)Lcom/helpshift/support/Faq;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->highlightedQuestion:Lcom/helpshift/support/Faq;

    return-object p0
.end method

.method static synthetic access$002(Lcom/helpshift/support/fragments/SingleQuestionFragment;Lcom/helpshift/support/Faq;)Lcom/helpshift/support/Faq;
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->highlightedQuestion:Lcom/helpshift/support/Faq;

    return-object p1
.end method

.method static synthetic access$100(Lcom/helpshift/support/fragments/SingleQuestionFragment;)Lcom/helpshift/support/Faq;
    .locals 0

    .line 51
    iget-object p0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    return-object p0
.end method

.method private getColorsFromTheme(Landroid/content/Context;)V
    .locals 1

    const v0, 0x1010036

    .line 143
    invoke-static {p1, v0}, Lcom/helpshift/util/Styles;->getHexColor(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->textColor:Ljava/lang/String;

    .line 144
    sget v0, Lcom/helpshift/R$attr;->hs__faqTextColorLink:I

    invoke-static {p1, v0}, Lcom/helpshift/util/Styles;->getHexColor(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->textColorLink:Ljava/lang/String;

    return-void
.end method

.method private getStyledBody(Lcom/helpshift/support/Faq;)Ljava/lang/String;
    .locals 10

    .line 278
    invoke-static {}, Lcom/helpshift/views/FontApplier;->getFontPath()Ljava/lang/String;

    move-result-object v0

    .line 281
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, ""

    if-nez v1, :cond_0

    .line 282
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file:///android_asset/"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 283
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "@font-face {    font-family: custom;    src: url(\'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\');}"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "font-family: custom, sans-serif;"

    goto :goto_0

    :cond_0
    move-object v0, v2

    move-object v1, v0

    .line 291
    :goto_0
    iget-object v3, p1, Lcom/helpshift/support/Faq;->body:Ljava/lang/String;

    .line 292
    iget-object v4, p1, Lcom/helpshift/support/Faq;->title:Ljava/lang/String;

    .line 296
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    const-string v6, "javascript:"

    const-string v7, "<script"

    if-nez v5, :cond_1

    .line 297
    invoke-virtual {v3, v7, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 298
    invoke-virtual {v3, v6, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 303
    :cond_1
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 304
    invoke-virtual {v4, v7, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 305
    invoke-virtual {v4, v6, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 308
    :cond_2
    iget-object p1, p1, Lcom/helpshift/support/Faq;->is_rtl:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 309
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "<html dir=\"rtl\">"

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    goto :goto_1

    .line 312
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "<html>"

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    :goto_1
    const-string v2, "<head>"

    .line 315
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "    <style type=\'text/css\'>"

    .line 316
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        img,"

    .line 318
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        object,"

    .line 319
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        embed {"

    .line 320
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "            max-width: 100%;"

    .line 321
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        }"

    .line 322
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        a,"

    .line 323
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        a:visited,"

    .line 324
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        a:active,"

    .line 325
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        a:hover {"

    .line 326
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "            color: "

    .line 327
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->textColorLink:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ";"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "        body {"

    .line 329
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "            background-color: transparent;"

    .line 330
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "            margin: 0;"

    .line 331
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "            padding: "

    .line 332
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "16px 16px 96px 16px;"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "            font-size: "

    .line 333
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "16px"

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "            line-height: "

    .line 335
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "1.5"

    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "            white-space: normal;"

    .line 336
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "            word-wrap: break-word;"

    .line 337
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->textColor:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "        .title {"

    .line 340
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "            display: block;"

    .line 341
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 342
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "            padding: 0 0 "

    .line 343
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x10

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " 0;"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "24px"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "32px"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        h1, h2, h3 { "

    .line 348
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            line-height: 1.4; "

    .line 349
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    </style>"

    .line 351
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    <script language=\'javascript\'>"

    .line 352
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "     window.onload = function () {"

    .line 353
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        var w = window,"

    .line 354
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            d = document,"

    .line 355
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            e = d.documentElement,"

    .line 356
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            g = d.getElementsByTagName(\'body\')[0],"

    .line 357
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            sWidth = Math.min (w.innerWidth || Infinity, e.clientWidth || Infinity, g.clientWidth || Infinity),"

    .line 360
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            sHeight = Math.min (w.innerHeight || Infinity, e.clientHeight || Infinity, g.clientHeight || Infinity);"

    .line 362
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        var frame, fw, fh;"

    .line 364
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        var iframes = document.getElementsByTagName(\'iframe\');"

    .line 365
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        var padding = "

    .line 366
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "        for (var i=0; i < iframes.length; i++) {"

    .line 367
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            frame = iframes[i];"

    .line 368
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            fw = frame.offsetWidth;"

    .line 369
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            fh = frame.offsetHeight;"

    .line 370
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            if (fw >= fh && fw > (sWidth - padding)) {"

    .line 371
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "                frame.style.width = sWidth - padding;"

    .line 372
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "                frame.style.height = ((sWidth - padding) * fh/fw).toString();"

    .line 373
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "            }"

    .line 374
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        document.addEventListener(\'click\', function (event) {"

    .line 376
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "            if (event.target instanceof HTMLImageElement) {"

    .line 377
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "                event.preventDefault();"

    .line 378
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "                event.stopPropagation();"

    .line 379
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "        }, false);"

    .line 381
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "    };"

    .line 382
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "    </script>"

    .line 383
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</head>"

    .line 384
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "<body>"

    .line 385
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "    <strong class=\'title\'> "

    .line 386
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " </strong> "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</body>"

    .line 387
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</html>"

    .line 388
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private hideQuestionFooter()V
    .locals 2

    .line 525
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private highlightAndReloadQuestion()V
    .locals 3

    const/4 v0, 0x1

    .line 475
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHighlighted:Z

    .line 476
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "searchTerms"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 477
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v1

    new-instance v2, Lcom/helpshift/support/fragments/SingleQuestionFragment$1;

    invoke-direct {v2, p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment$1;-><init>(Lcom/helpshift/support/fragments/SingleQuestionFragment;Ljava/util/ArrayList;)V

    invoke-virtual {v1, v2}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private markQuestion(Z)V
    .locals 2

    .line 393
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    if-nez v0, :cond_0

    return-void

    .line 396
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v0

    .line 398
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v1, v0, p1}, Lcom/helpshift/support/HSApiData;->markFaqInDB(Ljava/lang/String;Z)V

    .line 401
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getFaqDM()Lcom/helpshift/faq/FaqsDM;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/helpshift/faq/FaqsDM;->markHelpful(Ljava/lang/String;Z)V

    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;IZLcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;)Lcom/helpshift/support/fragments/SingleQuestionFragment;
    .locals 1

    .line 91
    new-instance v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;

    invoke-direct {v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;-><init>()V

    .line 92
    invoke-virtual {v0, p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->setArguments(Landroid/os/Bundle;)V

    .line 93
    iput p1, v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    .line 94
    iput-boolean p2, v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showRootLayoutInsideCardView:Z

    .line 95
    iput-object p3, v0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionReadListener:Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;

    return-object v0
.end method

.method private setIsHelpful(I)V
    .locals 0

    if-eqz p1, :cond_0

    .line 450
    iput p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHelpful:I

    .line 452
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->updateFooter()V

    return-void
.end method

.method private showHelpfulFooter()V
    .locals 3

    .line 537
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 538
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooterMessage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/helpshift/R$string;->hs__question_helpful_message:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 539
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooterMessage:Landroid/widget/TextView;

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 540
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 541
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 542
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method private showProgress(Z)V
    .locals 1

    .line 495
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->progressBar:Landroid/view/View;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 497
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    .line 500
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private showQuestionFooter()V
    .locals 4

    .line 529
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 530
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooterMessage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/helpshift/R$string;->hs__mark_yes_no_question:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 531
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 532
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 533
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method private showQuestionFooterContactUs()V
    .locals 2

    .line 554
    sget-object v0, Lcom/helpshift/support/ContactUsFilter$LOCATION;->QUESTION_FOOTER:Lcom/helpshift/support/ContactUsFilter$LOCATION;

    invoke-static {v0}, Lcom/helpshift/support/ContactUsFilter;->showContactUs(Lcom/helpshift/support/ContactUsFilter$LOCATION;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 555
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    goto :goto_0

    .line 558
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private showUnhelpfulFooter()V
    .locals 3

    .line 546
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 547
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooterMessage:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/helpshift/R$string;->hs__question_unhelpful_message:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 548
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showQuestionFooterContactUs()V

    .line 549
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 550
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method

.method private updateFooter()V
    .locals 2

    .line 506
    iget v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 507
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->hideQuestionFooter()V

    return-void

    .line 511
    :cond_0
    iget v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHelpful:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 516
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showHelpfulFooter()V

    goto :goto_0

    .line 513
    :cond_2
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showQuestionFooter()V

    goto :goto_0

    .line 519
    :cond_3
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showUnhelpfulFooter()V

    :goto_0
    return-void
.end method


# virtual methods
.method public getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;
    .locals 1

    .line 441
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/contracts/FaqFlowViewParent;

    if-eqz v0, :cond_0

    .line 443
    invoke-interface {v0}, Lcom/helpshift/support/contracts/FaqFlowViewParent;->getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getQuestionId()Ljava/lang/String;
    .locals 1

    .line 564
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    if-eqz v0, :cond_0

    .line 565
    invoke-virtual {v0}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getQuestionPublishId()Ljava/lang/String;
    .locals 1

    .line 571
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionPublishId:Ljava/lang/String;

    return-object v0
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 102
    :try_start_0
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onAttach(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    new-instance v0, Lcom/helpshift/support/HSApiData;

    invoke-direct {v0, p1}, Lcom/helpshift/support/HSApiData;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->data:Lcom/helpshift/support/HSApiData;

    .line 110
    invoke-static {p0}, Lcom/helpshift/support/util/FragmentUtil;->getSupportFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 112
    invoke-virtual {p1}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    .line 114
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->fragmentName:Ljava/lang/String;

    return-void

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_SingleQstn"

    const-string v1, "Caught exception in SingleQuestionFragment.onAttach()"

    .line 105
    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 406
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->helpful_button:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    .line 407
    invoke-direct {p0, v2}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->markQuestion(Z)V

    .line 408
    invoke-direct {p0, v2}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->setIsHelpful(I)V

    .line 409
    iget p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 410
    invoke-static {p0}, Lcom/helpshift/support/util/FragmentUtil;->getSupportFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 412
    invoke-virtual {p1}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object p1

    .line 413
    invoke-virtual {p1}, Lcom/helpshift/support/controllers/SupportController;->actionDone()V

    goto :goto_0

    .line 417
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->unhelpful_button:I

    if-ne v0, v1, :cond_1

    const/4 p1, 0x0

    .line 418
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->markQuestion(Z)V

    const/4 p1, -0x1

    .line 419
    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->setIsHelpful(I)V

    goto :goto_0

    .line 421
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    sget v0, Lcom/helpshift/R$id;->contact_us_button:I

    if-ne p1, v0, :cond_3

    .line 422
    iget-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->supportController:Lcom/helpshift/support/controllers/SupportController;

    if-eqz p1, :cond_3

    .line 423
    iget p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    if-ne p1, v2, :cond_2

    .line 424
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;

    move-result-object p1

    if-eqz p1, :cond_3

    const/4 v0, 0x0

    .line 426
    invoke-interface {p1, v0}, Lcom/helpshift/support/contracts/FaqFragmentListener;->onContactUsClicked(Ljava/lang/String;)V

    goto :goto_0

    .line 430
    :cond_2
    invoke-static {p0}, Lcom/helpshift/support/util/FragmentUtil;->getSupportFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 432
    invoke-virtual {p1}, Lcom/helpshift/support/fragments/SupportFragment;->getSupportController()Lcom/helpshift/support/controllers/SupportController;

    move-result-object p1

    .line 433
    invoke-virtual {p1}, Lcom/helpshift/support/controllers/SupportController;->sendAnyway()V

    :cond_3
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 149
    invoke-super {p0, p1}, Lcom/helpshift/support/fragments/MainFragment;->onCreate(Landroid/os/Bundle;)V

    .line 150
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const-string v1, "decomp"

    .line 152
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->decomp:Z

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 159
    sget p3, Lcom/helpshift/R$layout;->hs__single_question_fragment:I

    .line 160
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showRootLayoutInsideCardView:Z

    if-eqz v0, :cond_0

    .line 161
    sget p3, Lcom/helpshift/R$layout;->hs__single_question_layout_with_cardview:I

    :cond_0
    const/4 v0, 0x0

    .line 163
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 251
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/util/SnackbarUtil;->hideSnackbar(Landroid/view/View;)V

    const/4 v0, 0x0

    .line 254
    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    .line 255
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    invoke-virtual {v1, v0}, Lcom/helpshift/support/webkit/CustomWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 256
    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    .line 257
    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    .line 258
    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    .line 259
    iput-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    .line 260
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onDestroyView()V

    return-void
.end method

.method public onPageFinished()V
    .locals 2

    .line 462
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 463
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showProgress(Z)V

    .line 464
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    iget v1, v1, Lcom/helpshift/support/Faq;->is_helpful:I

    invoke-direct {p0, v1}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->setIsHelpful(I)V

    .line 465
    iget-boolean v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHighlighted:Z

    if-eqz v1, :cond_0

    .line 466
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isHighlighted:Z

    goto :goto_0

    .line 469
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->highlightAndReloadQuestion()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onPageStarted()V
    .locals 1

    const/4 v0, 0x1

    .line 457
    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->showProgress(Z)V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 127
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onPause()V

    .line 128
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    invoke-virtual {v0}, Lcom/helpshift/support/webkit/CustomWebView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 226
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onResume()V

    .line 228
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isScreenLarge()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    .line 231
    instance-of v1, v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    if-eqz v1, :cond_0

    .line 232
    check-cast v0, Lcom/helpshift/support/fragments/FaqFlowFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/support/fragments/FaqFlowFragment;->updateSelectQuestionUI(Z)V

    .line 236
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    invoke-virtual {v0}, Lcom/helpshift/support/webkit/CustomWebView;->onResume()V

    .line 237
    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->decomp:Z

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isScreenLarge()Z

    move-result v0

    if-nez v0, :cond_2

    .line 238
    :cond_1
    sget v0, Lcom/helpshift/R$string;->hs__question_header:I

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 241
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    if-eqz v0, :cond_3

    .line 242
    invoke-virtual {v0}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v0

    .line 243
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->eventSent:Z

    if-nez v0, :cond_3

    .line 244
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->reportReadFaqEvent()V

    :cond_3
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 119
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStart()V

    .line 120
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 121
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->eventSent:Z

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 0

    .line 133
    invoke-super {p0}, Lcom/helpshift/support/fragments/MainFragment;->onStop()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 11

    .line 170
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 172
    sget p2, Lcom/helpshift/R$id;->web_view:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/helpshift/support/webkit/CustomWebView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    const/4 v0, 0x0

    .line 173
    invoke-virtual {p2, v0}, Lcom/helpshift/support/webkit/CustomWebView;->setBackgroundColor(I)V

    .line 174
    iget-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    new-instance v1, Lcom/helpshift/support/webkit/CustomWebViewClient;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lcom/helpshift/support/webkit/CustomWebViewClient;-><init>(Landroid/content/Context;Lcom/helpshift/support/webkit/CustomWebViewClient$CustomWebViewClientListeners;)V

    invoke-virtual {p2, v1}, Lcom/helpshift/support/webkit/CustomWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 176
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p2

    .line 177
    sget v1, Lcom/helpshift/R$id;->faq_content_view:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 178
    iget-object v2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    new-instance v3, Lcom/helpshift/support/webkit/CustomWebChromeClient;

    invoke-direct {v3, p2, v1}, Lcom/helpshift/support/webkit/CustomWebChromeClient;-><init>(Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Lcom/helpshift/support/webkit/CustomWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 180
    sget p2, Lcom/helpshift/R$id;->helpful_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    .line 181
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    sget p2, Lcom/helpshift/R$id;->unhelpful_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    .line 184
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 186
    sget p2, Lcom/helpshift/R$id;->question_footer:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooter:Landroid/view/View;

    .line 187
    sget p2, Lcom/helpshift/R$id;->question_footer_message:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionFooterMessage:Landroid/widget/TextView;

    .line 189
    sget p2, Lcom/helpshift/R$id;->contact_us_button:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    .line 190
    invoke-virtual {p2, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 194
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt p2, v1, :cond_0

    .line 195
    iget-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->yesButton:Landroid/widget/Button;

    sget v1, Lcom/helpshift/R$string;->hs__mark_yes:I

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setText(I)V

    .line 196
    iget-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->noButton:Landroid/widget/Button;

    sget v1, Lcom/helpshift/R$string;->hs__mark_no:I

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setText(I)V

    .line 197
    iget-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    sget v1, Lcom/helpshift/R$string;->hs__contact_us_btn:I

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setText(I)V

    .line 200
    :cond_0
    iget p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    const/4 v1, 0x2

    if-ne p2, v1, :cond_1

    .line 201
    iget-object p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->contactUsButton:Landroid/widget/Button;

    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/helpshift/R$string;->hs__send_anyway:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 204
    :cond_1
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string v1, "questionSource"

    .line 205
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionSource:Ljava/lang/String;

    const-string v1, "questionPublishId"

    .line 206
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionPublishId:Ljava/lang/String;

    const-string v1, "support_mode"

    .line 207
    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "questionLanguage"

    const-string v3, ""

    .line 211
    invoke-virtual {p2, v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 213
    iget p2, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->singleQuestionMode:I

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-ne p2, v3, :cond_2

    const/4 v8, 0x1

    goto :goto_0

    :cond_2
    const/4 v8, 0x0

    :goto_0
    if-nez v8, :cond_4

    if-ne v1, v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v7, 0x0

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v7, 0x1

    .line 217
    :goto_2
    iget-object v4, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->data:Lcom/helpshift/support/HSApiData;

    new-instance v5, Lcom/helpshift/support/fragments/SingleQuestionFragment$Success;

    invoke-direct {v5, p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment$Success;-><init>(Lcom/helpshift/support/fragments/SingleQuestionFragment;)V

    new-instance v6, Lcom/helpshift/support/fragments/SingleQuestionFragment$Failure;

    invoke-direct {v6, p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment$Failure;-><init>(Lcom/helpshift/support/fragments/SingleQuestionFragment;)V

    iget-object v9, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionPublishId:Ljava/lang/String;

    invoke-virtual/range {v4 .. v10}, Lcom/helpshift/support/HSApiData;->getQuestion(Landroid/os/Handler;Landroid/os/Handler;ZZLjava/lang/String;Ljava/lang/String;)V

    .line 221
    sget p2, Lcom/helpshift/R$id;->progress_bar:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->progressBar:Landroid/view/View;

    return-void
.end method

.method reportReadFaqEvent()V
    .locals 3

    .line 575
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 576
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    invoke-virtual {v1}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 577
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/util/HelpshiftConnectionUtil;->isOnline(Landroid/content/Context;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "nt"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionSource:Ljava/lang/String;

    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 580
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionSource:Ljava/lang/String;

    const-string v2, "src"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 583
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object v1

    sget-object v2, Lcom/helpshift/analytics/AnalyticsEventType;->READ_FAQ:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {v1, v2, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    .line 584
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->questionReadListener:Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;

    if-eqz v0, :cond_1

    .line 585
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    invoke-virtual {v1}, Lcom/helpshift/support/Faq;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/support/fragments/SingleQuestionFragment$QuestionReadListener;->onQuestionRead(Ljava/lang/String;)V

    :cond_1
    const/4 v0, 0x1

    .line 587
    iput-boolean v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->eventSent:Z

    return-void
.end method

.method setQuestion(Lcom/helpshift/support/Faq;)V
    .locals 7

    .line 264
    iput-object p1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->question:Lcom/helpshift/support/Faq;

    .line 265
    iget-object v0, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    if-eqz v0, :cond_0

    .line 266
    invoke-virtual {p0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getColorsFromTheme(Landroid/content/Context;)V

    .line 267
    iget-object v1, p0, Lcom/helpshift/support/fragments/SingleQuestionFragment;->webView:Lcom/helpshift/support/webkit/CustomWebView;

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Lcom/helpshift/support/fragments/SingleQuestionFragment;->getStyledBody(Lcom/helpshift/support/Faq;)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    const-string v4, "text/html"

    const-string v5, "utf-8"

    invoke-virtual/range {v1 .. v6}, Lcom/helpshift/support/webkit/CustomWebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public shouldRefreshMenu()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

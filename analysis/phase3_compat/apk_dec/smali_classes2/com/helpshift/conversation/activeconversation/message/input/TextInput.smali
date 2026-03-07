.class public Lcom/helpshift/conversation/activeconversation/message/input/TextInput;
.super Lcom/helpshift/conversation/activeconversation/message/input/Input;
.source "TextInput.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/input/TextInput$Keyboard;
    }
.end annotation


# instance fields
.field private domain:Lcom/helpshift/common/domain/Domain;

.field public final keyboard:I

.field public final placeholder:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V
    .locals 1

    .line 28
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V

    .line 29
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    .line 30
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    .line 31
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->domain:Lcom/helpshift/common/domain/Domain;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->domain:Lcom/helpshift/common/domain/Domain;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 23
    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    .line 24
    iput p6, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/input/TextInput;
    .locals 1

    .line 86
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/TextInput;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 73
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 77
    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;

    .line 79
    iget v2, v0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    iget v3, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    if-ne v2, v3, :cond_1

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->placeholder:Ljava/lang/String;

    .line 80
    invoke-static {v0, v2}, Lcom/helpshift/util/StringUtils;->isEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/input/Input;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public setDependencies(Lcom/helpshift/common/domain/Domain;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->domain:Lcom/helpshift/common/domain/Domain;

    return-void
.end method

.method public validate(Ljava/lang/String;)Z
    .locals 3

    .line 46
    iget v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->keyboard:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_1

    const/4 v1, 0x4

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    return v2

    .line 56
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/TextInput;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;->getCurrentLocale()Ljava/util/Locale;

    move-result-object v0

    const-string v1, "EEEE, MMMM dd, yyyy"

    .line 58
    invoke-static {v1, v0}, Lcom/helpshift/common/util/HSDateFormatSpec;->getDateFormatter(Ljava/lang/String;Ljava/util/Locale;)Lcom/helpshift/util/HSSimpleDateFormat;

    move-result-object v0

    .line 59
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/util/HSSimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :catch_0
    const/4 p1, 0x0

    return p1

    .line 50
    :cond_1
    invoke-static {p1}, Lcom/helpshift/util/HSPattern;->isPositiveNumber(Ljava/lang/String;)Z

    move-result p1

    return p1

    .line 48
    :cond_2
    invoke-static {p1}, Lcom/helpshift/util/HSPattern;->isValidEmail(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

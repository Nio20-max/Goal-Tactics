.class public Lcom/helpshift/support/external/DoubleMetaphone;
.super Ljava/lang/Object;
.source "DoubleMetaphone.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;
    }
.end annotation


# static fields
.field private static final ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

.field private static final L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

.field private static final L_T_K_S_N_M_B_Z:[Ljava/lang/String;

.field private static final SILENT_START:[Ljava/lang/String;

.field private static final VOWELS:Ljava/lang/String; = "AEIOUY"


# instance fields
.field maxCodeLen:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    const-string v0, "GN"

    const-string v1, "KN"

    const-string v2, "PN"

    const-string v3, "WR"

    const-string v4, "PS"

    .line 48
    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/support/external/DoubleMetaphone;->SILENT_START:[Ljava/lang/String;

    const-string v1, "L"

    const-string v2, "R"

    const-string v3, "N"

    const-string v4, "M"

    const-string v5, "B"

    const-string v6, "H"

    const-string v7, "F"

    const-string v8, "V"

    const-string v9, "W"

    const-string v10, " "

    .line 50
    filled-new-array/range {v1 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/support/external/DoubleMetaphone;->L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

    const-string v1, "ES"

    const-string v2, "EP"

    const-string v3, "EB"

    const-string v4, "EL"

    const-string v5, "EY"

    const-string v6, "IB"

    const-string v7, "IL"

    const-string v8, "IN"

    const-string v9, "IE"

    const-string v10, "EI"

    const-string v11, "ER"

    .line 52
    filled-new-array/range {v1 .. v11}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/support/external/DoubleMetaphone;->ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

    const-string v1, "L"

    const-string v2, "T"

    const-string v3, "K"

    const-string v4, "S"

    const-string v5, "N"

    const-string v6, "M"

    const-string v7, "B"

    const-string v8, "Z"

    .line 54
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/helpshift/support/external/DoubleMetaphone;->L_T_K_S_N_M_B_Z:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 60
    iput v0, p0, Lcom/helpshift/support/external/DoubleMetaphone;->maxCodeLen:I

    return-void
.end method

.method protected static contains(Ljava/lang/String;II[Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-ltz p1, :cond_1

    add-int/2addr p2, p1

    .line 76
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt p2, v1, :cond_1

    .line 77
    invoke-virtual {p0, p1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 79
    array-length p1, p3

    const/4 p2, 0x0

    :goto_0
    if-ge p2, p1, :cond_1

    aget-object v1, p3, p2

    .line 80
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method


# virtual methods
.method protected charAt(Ljava/lang/String;I)C
    .locals 1

    if-ltz p2, :cond_1

    .line 1310
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt p2, v0, :cond_0

    goto :goto_0

    .line 1313
    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public doubleMetaphone(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 22

    move-object/from16 v0, p0

    if-nez p1, :cond_0

    const/4 v1, 0x0

    return-object v1

    .line 106
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    const/4 v1, 0x0

    return-object v1

    .line 110
    :cond_1
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x57

    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    const/16 v4, 0x4b

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-gt v2, v3, :cond_3

    invoke-virtual {v1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gt v2, v3, :cond_3

    const-string v2, "CZ"

    .line 113
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-gt v2, v3, :cond_3

    const-string v2, "WITZ"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-le v2, v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v2, 0x1

    .line 115
    :goto_1
    sget-object v7, Lcom/helpshift/support/external/DoubleMetaphone;->SILENT_START:[Ljava/lang/String;

    array-length v8, v7

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v8, :cond_5

    aget-object v10, v7, v9

    .line 116
    invoke-virtual {v1, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_4

    const/4 v7, 0x1

    goto :goto_3

    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_5
    const/4 v7, 0x0

    .line 123
    :goto_3
    new-instance v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;

    iget v9, v0, Lcom/helpshift/support/external/DoubleMetaphone;->maxCodeLen:I

    invoke-direct {v8, v0, v9}, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;-><init>(Lcom/helpshift/support/external/DoubleMetaphone;I)V

    .line 125
    :goto_4
    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-lt v9, v10, :cond_6

    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v9, v10, :cond_ff

    :cond_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v6

    if-gt v7, v9, :cond_ff

    .line 127
    invoke-virtual {v1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0xc7

    const/16 v11, 0x53

    if-eq v9, v10, :cond_fd

    const/16 v10, 0xd1

    if-eq v9, v10, :cond_fb

    const-string v13, "E"

    const-string v14, "KS"

    const/16 v12, 0x54

    const-string v4, "AEIOUY"

    const/16 v15, 0x48

    const/16 v3, 0x4a

    const/4 v10, 0x2

    packed-switch v9, :pswitch_data_0

    :cond_7
    :goto_5
    add-int/lit8 v7, v7, 0x1

    :cond_8
    :goto_6
    const/4 v3, -0x1

    const/16 v4, 0x4b

    goto :goto_4

    :pswitch_0
    add-int/lit8 v4, v7, 0x1

    .line 1255
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    if-ne v9, v15, :cond_b

    .line 1257
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v9, :cond_9

    .line 1258
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1260
    :cond_9
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v9, :cond_a

    .line 1261
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_a
    :goto_7
    add-int/lit8 v7, v7, 0x2

    goto :goto_6

    :cond_b
    const-string v3, "ZO"

    const-string v9, "ZI"

    const-string v13, "ZA"

    .line 1266
    filled-new-array {v3, v9, v13}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v4, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_e

    if-eqz v2, :cond_c

    if-lez v7, :cond_c

    add-int/lit8 v3, v7, -0x1

    .line 1267
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    if-eq v3, v12, :cond_c

    goto :goto_8

    .line 1284
    :cond_c
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_d

    .line 1285
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1287
    :cond_d
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_11

    .line 1288
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 1268
    :cond_e
    :goto_8
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    sub-int/2addr v3, v9

    if-gt v6, v3, :cond_f

    .line 1270
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v9, "S"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 1273
    :cond_f
    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v11, "S"

    invoke-virtual {v11, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1275
    :goto_9
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    sub-int/2addr v3, v9

    if-gt v10, v3, :cond_10

    .line 1277
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v9, "TS"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 1280
    :cond_10
    iget-object v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v10, "TS"

    invoke-virtual {v10, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1291
    :cond_11
    :goto_a
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v9, 0x5a

    if-ne v3, v9, :cond_12

    add-int/lit8 v4, v7, 0x2

    :cond_12
    move v7, v4

    goto/16 :goto_6

    :pswitch_1
    if-nez v7, :cond_14

    .line 1221
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_13

    .line 1222
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1224
    :cond_13
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_7

    .line 1225
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5

    .line 1230
    :cond_14
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v6

    if-ne v7, v3, :cond_15

    add-int/lit8 v3, v7, -0x3

    const-string v4, "IAU"

    const-string v9, "EAU"

    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x3

    .line 1231
    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_18

    add-int/lit8 v3, v7, -0x2

    const-string v4, "AU"

    const-string v9, "OU"

    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    .line 1232
    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_18

    .line 1234
    :cond_15
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_16

    .line 1236
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 1239
    :cond_16
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1241
    :goto_b
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_17

    .line 1243
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_c

    .line 1246
    :cond_17
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_18
    :goto_c
    add-int/lit8 v3, v7, 0x1

    const-string v4, "C"

    const-string v9, "X"

    .line 1249
    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_19

    add-int/lit8 v3, v7, 0x2

    :cond_19
    :goto_d
    move v7, v3

    goto/16 :goto_6

    :pswitch_2
    const-string v3, "WR"

    .line 1151
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 1153
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_1a

    .line 1154
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x52

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_e

    :cond_1a
    const/16 v4, 0x52

    .line 1156
    :goto_e
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_a

    .line 1157
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_7

    :cond_1b
    if-nez v7, :cond_20

    add-int/lit8 v3, v7, 0x1

    .line 1162
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    const/4 v11, -0x1

    if-ne v9, v11, :cond_1c

    const-string v9, "WH"

    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v9

    .line 1163
    invoke-static {v1, v7, v10, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_20

    .line 1164
    :cond_1c
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-eq v4, v11, :cond_1e

    .line 1166
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_1d

    .line 1167
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x41

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1169
    :cond_1d
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_19

    .line 1170
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v7, 0x46

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 1175
    :cond_1e
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_1f

    .line 1176
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x41

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_f

    :cond_1f
    const/16 v7, 0x41

    .line 1178
    :goto_f
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v9, :cond_19

    .line 1179
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_d

    .line 1184
    :cond_20
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v6

    if-ne v7, v3, :cond_21

    add-int/lit8 v3, v7, -0x1

    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_25

    :cond_21
    add-int/lit8 v3, v7, -0x1

    const/4 v4, 0x5

    const-string v9, "EWSKI"

    const-string v11, "EWSKY"

    const-string v12, "OWSKI"

    const-string v13, "OWSKY"

    filled-new-array {v9, v11, v12, v13}, [Ljava/lang/String;

    move-result-object v9

    .line 1185
    invoke-static {v1, v3, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_25

    const-string v3, "SCH"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    .line 1187
    invoke-static {v1, v5, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_22

    goto :goto_12

    :cond_22
    const-string v3, "WICZ"

    const-string v4, "WITZ"

    .line 1194
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-static {v1, v7, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 1196
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_23

    .line 1198
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v4, "TS"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_10

    .line 1201
    :cond_23
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v9, "TS"

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1203
    :goto_10
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_24

    .line 1205
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v4, "FX"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_11

    .line 1208
    :cond_24
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v9, "FX"

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_11
    add-int/lit8 v7, v7, 0x4

    goto/16 :goto_6

    .line 1189
    :cond_25
    :goto_12
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_7

    .line 1190
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x46

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5

    .line 1141
    :pswitch_3
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_26

    .line 1142
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x46

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_13

    :cond_26
    const/16 v4, 0x46

    .line 1144
    :goto_13
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_27

    .line 1145
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_27
    add-int/lit8 v3, v7, 0x1

    .line 1147
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v9, 0x56

    if-ne v4, v9, :cond_19

    goto/16 :goto_7

    :pswitch_4
    const-string v3, "TION"

    .line 1088
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-static {v1, v7, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 1089
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_28

    .line 1090
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_14

    :cond_28
    const/16 v4, 0x58

    .line 1092
    :goto_14
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_29

    .line 1093
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_29
    :goto_15
    add-int/lit8 v7, v7, 0x3

    goto/16 :goto_6

    :cond_2a
    const-string v3, "TIA"

    const-string v4, "TCH"

    .line 1097
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v1, v7, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 1098
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_2b

    .line 1099
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_16

    :cond_2b
    const/16 v4, 0x58

    .line 1101
    :goto_16
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_29

    .line 1102
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_15

    :cond_2c
    const-string v3, "TH"

    .line 1106
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_30

    const-string v3, "TTH"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    .line 1107
    invoke-static {v1, v7, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2d

    goto :goto_17

    .line 1130
    :cond_2d
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_2e

    .line 1131
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1133
    :cond_2e
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_2f

    .line 1134
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_2f
    add-int/lit8 v3, v7, 0x1

    const-string v4, "T"

    const-string v9, "D"

    .line 1136
    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_19

    add-int/lit8 v3, v7, 0x2

    goto/16 :goto_d

    :cond_30
    :goto_17
    add-int/lit8 v7, v7, 0x2

    const-string v3, "OM"

    const-string v4, "AM"

    .line 1108
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_33

    const-string v3, "VAN "

    const-string v4, "VON "

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    .line 1110
    invoke-static {v1, v5, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_33

    const-string v3, "SCH"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    .line 1111
    invoke-static {v1, v5, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_31

    goto :goto_18

    .line 1120
    :cond_31
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_32

    .line 1121
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x30

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1123
    :cond_32
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_8

    .line 1124
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_6

    .line 1112
    :cond_33
    :goto_18
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_34

    .line 1113
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1115
    :cond_34
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_8

    .line 1116
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_6

    :pswitch_5
    add-int/lit8 v3, v7, -0x1

    const-string v9, "ISL"

    const-string v12, "YSL"

    .line 910
    filled-new-array {v9, v12}, [Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    invoke-static {v1, v3, v12, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    :goto_19
    goto/16 :goto_5a

    :cond_35
    if-nez v7, :cond_37

    const/4 v3, 0x5

    const-string v9, "SUGAR"

    .line 914
    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v7, v3, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 916
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_36

    .line 917
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 919
    :cond_36
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f9

    .line 920
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_19

    :cond_37
    const-string v3, "SH"

    .line 924
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    add-int/lit8 v3, v7, 0x1

    const-string v4, "HEIM"

    const-string v9, "HOEK"

    const-string v10, "HOLM"

    const-string v12, "HOLZ"

    .line 925
    filled-new-array {v4, v9, v10, v12}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_39

    .line 928
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_38

    .line 929
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 931
    :cond_38
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 932
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1b

    .line 936
    :cond_39
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3a

    .line 937
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1a

    :cond_3a
    const/16 v4, 0x58

    .line 939
    :goto_1a
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_3b

    .line 940
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_3b
    :goto_1b
    add-int/lit8 v7, v7, 0x2

    goto/16 :goto_5b

    :cond_3c
    const-string v3, "SIO"

    const-string v9, "SIA"

    .line 945
    filled-new-array {v3, v9}, [Ljava/lang/String;

    move-result-object v3

    const/4 v9, 0x3

    invoke-static {v1, v7, v9, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_56

    const-string v3, "SIAN"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v9, 0x4

    .line 946
    invoke-static {v1, v7, v9, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3d

    goto/16 :goto_23

    :cond_3d
    if-nez v7, :cond_3e

    add-int/lit8 v3, v7, 0x1

    const-string v9, "M"

    const-string v12, "N"

    const-string v14, "L"

    const-string v5, "W"

    .line 966
    filled-new-array {v9, v12, v14, v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v3, v6, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3f

    :cond_3e
    add-int/lit8 v3, v7, 0x1

    const-string v5, "Z"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    .line 968
    invoke-static {v1, v3, v6, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_43

    .line 973
    :cond_3f
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_40

    .line 974
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 976
    :cond_40
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_41

    .line 977
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_41
    add-int/lit8 v3, v7, 0x1

    const-string v4, "Z"

    .line 979
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    :goto_1c
    add-int/lit8 v3, v7, 0x2

    :cond_42
    :goto_1d
    move v7, v3

    goto/16 :goto_5b

    :cond_43
    const-string v5, "SC"

    .line 981
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v7, v10, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_52

    add-int/lit8 v3, v7, 0x2

    .line 982
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    const-string v9, "SK"

    if-ne v5, v15, :cond_4d

    add-int/lit8 v3, v7, 0x3

    const-string v16, "OO"

    const-string v17, "ER"

    const-string v18, "EN"

    const-string v19, "UY"

    const-string v20, "ED"

    const-string v21, "EM"

    .line 984
    filled-new-array/range {v16 .. v21}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v3, v10, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_49

    const-string v4, "ER"

    const-string v5, "EN"

    .line 988
    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_46

    .line 990
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v6, v3, :cond_44

    .line 992
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v4, "X"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1e

    .line 995
    :cond_44
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v5, "X"

    const/4 v11, 0x0

    invoke-virtual {v5, v11, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 997
    :goto_1e
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_45

    .line 999
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1002
    :cond_45
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1006
    :cond_46
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_47

    .line 1008
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1f

    .line 1011
    :cond_47
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1013
    :goto_1f
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_48

    .line 1015
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1018
    :cond_48
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    :cond_49
    if-nez v7, :cond_4b

    const/4 v3, 0x3

    .line 1023
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4b

    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v4, 0x57

    if-eq v3, v4, :cond_4b

    .line 1024
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_4a

    .line 1025
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1027
    :cond_4a
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5a

    .line 1028
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1032
    :cond_4b
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_4c

    .line 1033
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    :cond_4c
    const/16 v4, 0x58

    .line 1035
    :goto_20
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_5a

    .line 1036
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    :cond_4d
    const-string v4, "I"

    const-string v5, "Y"

    .line 1041
    filled-new-array {v4, v13, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4f

    .line 1042
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_4e

    .line 1043
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1045
    :cond_4e
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5a

    .line 1046
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1050
    :cond_4f
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_50

    .line 1052
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_21

    .line 1055
    :cond_50
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1057
    :goto_21
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_51

    .line 1059
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1062
    :cond_51
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v5, 0x0

    invoke-virtual {v9, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 1068
    :cond_52
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v6

    if-ne v7, v4, :cond_53

    add-int/lit8 v4, v7, -0x2

    const-string v5, "AI"

    const-string v9, "OI"

    filled-new-array {v5, v9}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v10, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_53

    .line 1070
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_55

    .line 1071
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 1075
    :cond_53
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_54

    .line 1076
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1078
    :cond_54
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_55

    .line 1079
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_55
    :goto_22
    const-string v4, "S"

    const-string v5, "Z"

    .line 1082
    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    goto/16 :goto_1c

    :cond_56
    :goto_23
    if-eqz v2, :cond_58

    .line 949
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_57

    .line 950
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 952
    :cond_57
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5a

    .line 953
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_24

    .line 957
    :cond_58
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_59

    .line 958
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 960
    :cond_59
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5a

    .line 961
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5a
    :goto_24
    add-int/lit8 v7, v7, 0x3

    goto/16 :goto_5b

    .line 891
    :pswitch_6
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v6

    if-ne v7, v3, :cond_5c

    if-nez v2, :cond_5c

    add-int/lit8 v3, v7, -0x2

    const-string v4, "IE"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    .line 892
    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5c

    add-int/lit8 v3, v7, -0x4

    const-string v4, "ME"

    const-string v5, "MA"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    .line 893
    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5c

    .line 894
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5b

    .line 895
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x52

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_26

    :cond_5b
    const/16 v4, 0x52

    goto :goto_26

    .line 899
    :cond_5c
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5d

    .line 900
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x52

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_25

    :cond_5d
    const/16 v4, 0x52

    .line 902
    :goto_25
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_5e

    .line 903
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_5e
    :goto_26
    add-int/lit8 v3, v7, 0x1

    .line 906
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    if-ne v5, v4, :cond_42

    goto/16 :goto_1b

    .line 882
    :pswitch_7
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_5f

    .line 883
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_27

    :cond_5f
    const/16 v4, 0x4b

    .line 885
    :goto_27
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_60

    .line 886
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_60
    add-int/lit8 v3, v7, 0x1

    .line 888
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x51

    if-ne v4, v5, :cond_42

    goto/16 :goto_1b

    :pswitch_8
    add-int/lit8 v3, v7, 0x1

    .line 861
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    if-ne v4, v15, :cond_62

    .line 862
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_61

    .line 863
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x46

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    :cond_61
    const/16 v4, 0x46

    .line 865
    :goto_28
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_3b

    .line 866
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 871
    :cond_62
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_63

    .line 872
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v5, 0x50

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 874
    :cond_63
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_64

    .line 875
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v5, 0x50

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_64
    const-string v4, "P"

    const-string v5, "B"

    .line 877
    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    add-int/lit8 v3, v7, 0x2

    goto/16 :goto_1d

    .line 841
    :pswitch_9
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_65

    .line 842
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_29

    :cond_65
    const/16 v4, 0x4e

    .line 844
    :goto_29
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_66

    .line 845
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_66
    add-int/lit8 v3, v7, 0x1

    .line 847
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    if-ne v5, v4, :cond_42

    goto/16 :goto_1b

    .line 823
    :pswitch_a
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_67

    .line 824
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 826
    :cond_67
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_68

    .line 827
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x4d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_68
    add-int/lit8 v3, v7, 0x1

    .line 830
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x4d

    if-ne v4, v5, :cond_6a

    :cond_69
    :goto_2a
    const/4 v4, 0x1

    goto :goto_2b

    :cond_6a
    add-int/lit8 v4, v7, -0x1

    const-string v5, "UMB"

    .line 834
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x3

    invoke-static {v1, v4, v9, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6b

    .line 835
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v6

    if-eq v3, v4, :cond_69

    add-int/lit8 v4, v7, 0x2

    const-string v5, "ER"

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    .line 836
    invoke-static {v1, v4, v10, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6b

    goto :goto_2a

    :cond_6b
    const/4 v4, 0x0

    :goto_2b
    if-eqz v4, :cond_42

    goto/16 :goto_1b

    :pswitch_b
    add-int/lit8 v3, v7, 0x1

    .line 782
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x4c

    if-ne v4, v5, :cond_71

    .line 784
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x3

    sub-int/2addr v3, v4

    if-ne v7, v3, :cond_6c

    add-int/lit8 v3, v7, -0x1

    const-string v4, "ILLO"

    const-string v9, "ILLA"

    const-string v11, "ALLE"

    filled-new-array {v4, v9, v11}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    .line 785
    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6c

    :goto_2c
    const/4 v3, 0x1

    goto :goto_2d

    .line 788
    :cond_6c
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v10

    const-string v4, "AS"

    const-string v9, "OS"

    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6d

    .line 789
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v6

    const-string v4, "A"

    const-string v9, "O"

    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6e

    :cond_6d
    add-int/lit8 v3, v7, -0x1

    const-string v4, "ALLE"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    .line 790
    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_6e

    goto :goto_2c

    :cond_6e
    const/4 v3, 0x0

    :goto_2d
    if-eqz v3, :cond_6f

    .line 797
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 798
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 802
    :cond_6f
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_70

    .line 803
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 805
    :cond_70
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 806
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 813
    :cond_71
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_72

    .line 814
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 816
    :cond_72
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_42

    .line 817
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1d

    .line 772
    :pswitch_c
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_73

    .line 773
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2e

    :cond_73
    const/16 v4, 0x4b

    .line 775
    :goto_2e
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_74

    .line 776
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_74
    add-int/lit8 v3, v7, 0x1

    .line 778
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    if-ne v5, v4, :cond_42

    goto/16 :goto_1b

    :pswitch_d
    const-string v5, "JOSE"

    .line 705
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x4

    invoke-static {v1, v7, v9, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_80

    const-string v5, "SAN "

    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    const/4 v10, 0x0

    invoke-static {v1, v10, v9, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_75

    goto/16 :goto_31

    :cond_75
    if-nez v7, :cond_77

    const-string v5, "JOSE"

    .line 727
    filled-new-array {v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v7, v9, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_77

    .line 728
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_76

    .line 729
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 731
    :cond_76
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7e

    .line 732
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v5, 0x41

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_2f

    :cond_77
    add-int/lit8 v5, v7, -0x1

    .line 735
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    invoke-virtual {v4, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v9, -0x1

    if-eq v4, v9, :cond_7a

    if-nez v2, :cond_7a

    add-int/lit8 v4, v7, 0x1

    .line 736
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    const/16 v10, 0x41

    if-eq v9, v10, :cond_78

    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v9, 0x4f

    if-ne v4, v9, :cond_7a

    .line 737
    :cond_78
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_79

    .line 738
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 740
    :cond_79
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7e

    .line 741
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 744
    :cond_7a
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v6

    if-ne v7, v4, :cond_7c

    .line 745
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7b

    .line 746
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 748
    :cond_7b
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7e

    .line 749
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v5, 0x20

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    :cond_7c
    add-int/lit8 v4, v7, 0x1

    .line 752
    sget-object v9, Lcom/helpshift/support/external/DoubleMetaphone;->L_T_K_S_N_M_B_Z:[Ljava/lang/String;

    invoke-static {v1, v4, v6, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7e

    const-string v4, "S"

    const-string v9, "K"

    const-string v10, "L"

    filled-new-array {v4, v9, v10}, [Ljava/lang/String;

    move-result-object v4

    .line 753
    invoke-static {v1, v5, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7e

    .line 754
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7d

    .line 755
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 757
    :cond_7d
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_7e

    .line 758
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_7e
    :goto_2f
    add-int/lit8 v4, v7, 0x1

    .line 762
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    if-ne v5, v3, :cond_7f

    goto/16 :goto_1b

    :cond_7f
    :goto_30
    move v7, v4

    goto/16 :goto_5b

    :cond_80
    :goto_31
    if-nez v7, :cond_81

    add-int/lit8 v4, v7, 0x4

    .line 707
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x20

    if-eq v4, v5, :cond_84

    .line 708
    :cond_81
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-eq v4, v5, :cond_84

    const-string v4, "SAN "

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x0

    invoke-static {v1, v9, v5, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_82

    goto :goto_32

    .line 717
    :cond_82
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_83

    .line 718
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 720
    :cond_83
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f9

    .line 721
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5a

    .line 709
    :cond_84
    :goto_32
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_85

    .line 710
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 712
    :cond_85
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f9

    .line 713
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5a

    :pswitch_e
    if-eqz v7, :cond_86

    add-int/lit8 v3, v7, -0x1

    .line 687
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    const/4 v5, -0x1

    if-eq v3, v5, :cond_f9

    goto :goto_33

    :cond_86
    const/4 v5, -0x1

    :goto_33
    add-int/lit8 v3, v7, 0x1

    .line 688
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v3, v5, :cond_f9

    .line 689
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_87

    .line 690
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 692
    :cond_87
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 693
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :pswitch_f
    add-int/lit8 v5, v7, 0x1

    .line 476
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    if-ne v9, v15, :cond_94

    if-lez v7, :cond_89

    add-int/lit8 v5, v7, -0x1

    .line 478
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_89

    .line 479
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_88

    .line 480
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_34

    :cond_88
    const/16 v4, 0x4b

    .line 482
    :goto_34
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_3b

    .line 483
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_89
    if-nez v7, :cond_8d

    add-int/lit8 v7, v7, 0x2

    .line 488
    invoke-virtual {v0, v1, v7}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x49

    if-ne v4, v5, :cond_8b

    .line 489
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_8a

    .line 490
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 492
    :cond_8a
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_fa

    .line 493
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5b

    .line 497
    :cond_8b
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_8c

    .line 498
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_35

    :cond_8c
    const/16 v4, 0x4b

    .line 500
    :goto_35
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_fa

    .line 501
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5b

    :cond_8d
    if-le v7, v6, :cond_8e

    add-int/lit8 v3, v7, -0x2

    const-string v4, "B"

    const-string v5, "H"

    const-string v9, "D"

    .line 506
    filled-new-array {v4, v5, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3b

    :cond_8e
    if-le v7, v10, :cond_8f

    add-int/lit8 v3, v7, -0x3

    const-string v4, "B"

    const-string v5, "H"

    const-string v9, "D"

    filled-new-array {v4, v5, v9}, [Ljava/lang/String;

    move-result-object v4

    .line 507
    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3b

    :cond_8f
    const/4 v3, 0x3

    if-le v7, v3, :cond_90

    add-int/lit8 v3, v7, -0x4

    const-string v4, "B"

    const-string v5, "H"

    filled-new-array {v4, v5}, [Ljava/lang/String;

    move-result-object v4

    .line 508
    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_90

    goto/16 :goto_1b

    :cond_90
    if-le v7, v10, :cond_92

    add-int/lit8 v3, v7, -0x1

    .line 513
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v4, 0x55

    if-ne v3, v4, :cond_92

    add-int/lit8 v3, v7, -0x3

    const-string v4, "C"

    const-string v5, "G"

    const-string v9, "L"

    const-string v10, "R"

    const-string v11, "T"

    filled-new-array {v4, v5, v9, v10, v11}, [Ljava/lang/String;

    move-result-object v4

    .line 514
    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_92

    .line 518
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_91

    .line 519
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x46

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_36

    :cond_91
    const/16 v4, 0x46

    .line 521
    :goto_36
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_3b

    .line 522
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_92
    if-lez v7, :cond_3b

    add-int/lit8 v3, v7, -0x1

    .line 525
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v4, 0x49

    if-eq v3, v4, :cond_3b

    .line 526
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_93

    .line 527
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_37

    :cond_93
    const/16 v4, 0x4b

    .line 529
    :goto_37
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_3b

    .line 530
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 537
    :cond_94
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    const/16 v11, 0x4e

    if-ne v9, v11, :cond_9d

    const-string v3, "KN"

    if-ne v7, v6, :cond_97

    const/4 v9, 0x0

    .line 538
    invoke-virtual {v0, v1, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v11

    invoke-virtual {v4, v11}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v9, -0x1

    if-eq v4, v9, :cond_97

    if-nez v2, :cond_97

    .line 539
    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v4, v5

    if-gt v10, v4, :cond_95

    .line 541
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_38

    .line 544
    :cond_95
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v3, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    :goto_38
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v6, v3, :cond_96

    .line 548
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v4, "N"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 551
    :cond_96
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v5, "N"

    const/4 v9, 0x0

    invoke-virtual {v5, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_97
    add-int/lit8 v4, v7, 0x2

    const-string v9, "EY"

    .line 554
    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v4, v10, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_9a

    .line 555
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v5, 0x59

    if-eq v4, v5, :cond_9a

    if-nez v2, :cond_9a

    .line 556
    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v4, v5

    if-gt v6, v4, :cond_98

    .line 558
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v5, "N"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_39

    .line 561
    :cond_98
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v9, "N"

    const/4 v11, 0x0

    invoke-virtual {v9, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    :goto_39
    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v4, v5

    if-gt v10, v4, :cond_99

    .line 565
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 568
    :cond_99
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v3, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 572
    :cond_9a
    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v4, v5

    if-gt v10, v4, :cond_9b

    .line 574
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3a

    .line 577
    :cond_9b
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v3, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    :goto_3a
    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v4, v5

    if-gt v10, v4, :cond_9c

    .line 581
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 584
    :cond_9c
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v3, v9, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_9d
    const-string v4, "LI"

    .line 589
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v5, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a0

    if-nez v2, :cond_a0

    .line 590
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_9e

    .line 592
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v4, "KL"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3b

    .line 595
    :cond_9e
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v5, "KL"

    const/4 v9, 0x0

    invoke-virtual {v5, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 597
    :goto_3b
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v6, v3, :cond_9f

    .line 599
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v4, "L"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 602
    :cond_9f
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v5, "L"

    const/4 v9, 0x0

    invoke-virtual {v5, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_a0
    if-nez v7, :cond_a3

    .line 607
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v9, 0x59

    if-eq v4, v9, :cond_a1

    sget-object v4, Lcom/helpshift/support/external/DoubleMetaphone;->ES_EP_EB_EL_EY_IB_IL_IN_IE_EI_ER:[Ljava/lang/String;

    .line 608
    invoke-static {v1, v5, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a3

    .line 610
    :cond_a1
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_a2

    .line 611
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v5, 0x4b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 613
    :cond_a2
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_3b

    .line 614
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_a3
    const-string v4, "ER"

    .line 618
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v5, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a4

    .line 619
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v9, 0x59

    if-ne v4, v9, :cond_a6

    :cond_a4
    const/4 v4, 0x6

    const-string v9, "DANGER"

    const-string v11, "RANGER"

    const-string v12, "MANGER"

    filled-new-array {v9, v11, v12}, [Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x0

    .line 620
    invoke-static {v1, v11, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a6

    add-int/lit8 v4, v7, -0x1

    const-string v9, "I"

    filled-new-array {v13, v9}, [Ljava/lang/String;

    move-result-object v9

    .line 621
    invoke-static {v1, v4, v6, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_a6

    const-string v9, "RGY"

    const-string v11, "OGY"

    filled-new-array {v9, v11}, [Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x3

    .line 622
    invoke-static {v1, v4, v11, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a6

    .line 624
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_a5

    .line 625
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v5, 0x4b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 627
    :cond_a5
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_3b

    .line 628
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_a6
    const-string v4, "I"

    const-string v9, "Y"

    .line 632
    filled-new-array {v13, v4, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v5, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_ac

    add-int/lit8 v4, v7, -0x1

    const-string v9, "AGGI"

    const-string v11, "OGGI"

    filled-new-array {v9, v11}, [Ljava/lang/String;

    move-result-object v9

    const/4 v11, 0x4

    .line 633
    invoke-static {v1, v4, v11, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a7

    goto :goto_3d

    .line 664
    :cond_a7
    invoke-virtual {v0, v1, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v4, 0x47

    if-ne v3, v4, :cond_a9

    add-int/lit8 v7, v7, 0x2

    .line 666
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_a8

    .line 667
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3c

    :cond_a8
    const/16 v4, 0x4b

    .line 669
    :goto_3c
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_fa

    .line 670
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5b

    :cond_a9
    const/16 v4, 0x4b

    .line 675
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v7, :cond_aa

    .line 676
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 678
    :cond_aa
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v7, :cond_ab

    .line 679
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_ab
    move v7, v5

    goto/16 :goto_5b

    :cond_ac
    :goto_3d
    const-string v4, "VAN "

    const-string v9, "VON "

    .line 635
    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    const/4 v11, 0x0

    invoke-static {v1, v11, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_b1

    const-string v4, "SCH"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x3

    .line 636
    invoke-static {v1, v11, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_b1

    const-string v4, "ET"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    .line 637
    invoke-static {v1, v5, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ad

    goto :goto_3e

    :cond_ad
    const-string v4, "IER"

    .line 646
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v5, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_af

    .line 647
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_ae

    .line 648
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 650
    :cond_ae
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_3b

    .line 651
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 655
    :cond_af
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_b0

    .line 656
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 658
    :cond_b0
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 659
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    :cond_b1
    :goto_3e
    const/16 v4, 0x4b

    .line 639
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_b2

    .line 640
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 642
    :cond_b2
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_3b

    .line 643
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 466
    :pswitch_10
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_b3

    .line 467
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x46

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3f

    :cond_b3
    const/16 v4, 0x46

    .line 469
    :goto_3f
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v5, :cond_b4

    .line 470
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_b4
    add-int/lit8 v3, v7, 0x1

    .line 472
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    if-ne v5, v4, :cond_42

    goto/16 :goto_1b

    :pswitch_11
    const-string v4, "DG"

    .line 415
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v7, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b9

    add-int/lit8 v4, v7, 0x2

    const-string v5, "I"

    const-string v9, "Y"

    .line 417
    filled-new-array {v5, v13, v9}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v6, v5}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_b6

    .line 418
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_b5

    .line 419
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 421
    :cond_b5
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v5, :cond_5a

    .line 422
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_24

    .line 428
    :cond_b6
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v3, v5

    if-gt v10, v3, :cond_b7

    .line 430
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v5, "TK"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_40

    .line 433
    :cond_b7
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const-string v7, "TK"

    const/4 v9, 0x0

    invoke-virtual {v7, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    :goto_40
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    sub-int/2addr v3, v5

    if-gt v10, v3, :cond_b8

    .line 437
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v5, "TK"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_30

    .line 440
    :cond_b8
    iget-object v5, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const-string v7, "TK"

    const/4 v9, 0x0

    invoke-virtual {v7, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_30

    :cond_b9
    const-string v3, "DT"

    const-string v4, "DD"

    .line 445
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_bb

    .line 446
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ba

    .line 447
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 449
    :cond_ba
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_3b

    .line 450
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_1b

    .line 455
    :cond_bb
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_bc

    .line 456
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 458
    :cond_bc
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f9

    .line 459
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_5a

    :pswitch_12
    const-string v3, "CHIA"

    .line 167
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x4

    invoke-static {v1, v7, v5, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_bd

    const/4 v3, 0x1

    :goto_41
    const/4 v5, -0x1

    goto :goto_43

    :cond_bd
    if-gt v7, v6, :cond_be

    const/4 v3, 0x0

    goto :goto_41

    :cond_be
    add-int/lit8 v3, v7, -0x2

    .line 173
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_c0

    :cond_bf
    :goto_42
    const/4 v3, 0x0

    goto :goto_43

    :cond_c0
    add-int/lit8 v4, v7, -0x1

    const-string v9, "ACH"

    .line 176
    filled-new-array {v9}, [Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    invoke-static {v1, v4, v12, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_c1

    goto :goto_42

    :cond_c1
    add-int/lit8 v4, v7, 0x2

    .line 180
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v9, 0x49

    if-eq v4, v9, :cond_c2

    const/16 v9, 0x45

    if-ne v4, v9, :cond_c3

    :cond_c2
    const/4 v4, 0x6

    const-string v9, "BACHER"

    const-string v12, "MACHER"

    .line 181
    filled-new-array {v9, v12}, [Ljava/lang/String;

    move-result-object v9

    .line 182
    invoke-static {v1, v3, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_bf

    :cond_c3
    const/4 v3, 0x1

    :goto_43
    if-eqz v3, :cond_c6

    .line 185
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_c4

    .line 186
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_44

    :cond_c4
    const/16 v4, 0x4b

    .line 188
    :goto_44
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_c5

    .line 189
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_c5
    :goto_45
    add-int/lit8 v7, v7, 0x2

    :goto_46
    const/4 v9, 0x0

    :goto_47
    const/16 v12, 0x4b

    goto/16 :goto_5b

    :cond_c6
    if-nez v7, :cond_c8

    const/4 v3, 0x6

    const-string v4, "CAESAR"

    .line 194
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v7, v3, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c8

    .line 195
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_c7

    .line 196
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    :cond_c7
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_c5

    .line 199
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_45

    :cond_c8
    const-string v3, "CH"

    .line 204
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_da

    if-eqz v7, :cond_c9

    :goto_48
    const/4 v3, 0x0

    goto :goto_49

    :cond_c9
    add-int/lit8 v3, v7, 0x1

    const/4 v4, 0x5

    const-string v9, "HARAC"

    const-string v11, "HARIS"

    .line 210
    filled-new-array {v9, v11}, [Ljava/lang/String;

    move-result-object v9

    invoke-static {v1, v3, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_ca

    const-string v4, "HOR"

    const-string v9, "HYM"

    const-string v11, "HIA"

    const-string v12, "HEM"

    filled-new-array {v4, v9, v11, v12}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x3

    .line 211
    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_ca

    goto :goto_48

    :cond_ca
    const/4 v3, 0x5

    const-string v4, "CHORE"

    .line 215
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x0

    invoke-static {v1, v9, v3, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_cb

    goto :goto_48

    :cond_cb
    const/4 v3, 0x1

    :goto_49
    if-lez v7, :cond_cd

    const-string v4, "CHAE"

    .line 221
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    invoke-static {v1, v7, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_cd

    .line 222
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_cc

    .line 223
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 225
    :cond_cc
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_c5

    .line 226
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_45

    :cond_cd
    if-eqz v3, :cond_cf

    .line 232
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ce

    .line 233
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4a

    :cond_ce
    const/16 v4, 0x4b

    .line 235
    :goto_4a
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_c5

    .line 236
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_45

    :cond_cf
    const-string v3, "VAN "

    const-string v4, "VON "

    .line 240
    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    const/4 v9, 0x0

    .line 241
    invoke-static {v1, v9, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d8

    const-string v3, "SCH"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v1, v9, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d8

    add-int/lit8 v3, v7, -0x2

    const/4 v4, 0x6

    const-string v9, "ORCHES"

    const-string v11, "ARCHIT"

    const-string v12, "ORCHID"

    filled-new-array {v9, v11, v12}, [Ljava/lang/String;

    move-result-object v9

    .line 242
    invoke-static {v1, v3, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_d8

    add-int/lit8 v3, v7, 0x2

    const-string v4, "T"

    const-string v9, "S"

    filled-new-array {v4, v9}, [Ljava/lang/String;

    move-result-object v4

    .line 243
    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d8

    add-int/lit8 v4, v7, -0x1

    const-string v9, "A"

    const-string v11, "O"

    const-string v12, "U"

    filled-new-array {v9, v11, v12, v13}, [Ljava/lang/String;

    move-result-object v9

    .line 244
    invoke-static {v1, v4, v6, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d0

    if-nez v7, :cond_d1

    :cond_d0
    sget-object v4, Lcom/helpshift/support/external/DoubleMetaphone;->L_R_N_M_B_H_F_V_W_SPACE:[Ljava/lang/String;

    .line 246
    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_d8

    add-int/lit8 v4, v7, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v6

    if-ne v4, v9, :cond_d1

    goto/16 :goto_4e

    :cond_d1
    if-lez v7, :cond_d5

    const-string v4, "MC"

    .line 258
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-static {v1, v7, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d3

    .line 259
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_d2

    .line 260
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x4b

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4b

    :cond_d2
    const/16 v7, 0x4b

    .line 262
    :goto_4b
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v9, :cond_d7

    .line 263
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4d

    .line 267
    :cond_d3
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_d4

    .line 268
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x58

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 270
    :cond_d4
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_d7

    .line 271
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v7, 0x4b

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4d

    .line 276
    :cond_d5
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_d6

    .line 277
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x58

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4c

    :cond_d6
    const/16 v7, 0x58

    .line 279
    :goto_4c
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v9, :cond_d7

    .line 280
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_d7
    :goto_4d
    move v7, v3

    goto/16 :goto_46

    .line 248
    :cond_d8
    :goto_4e
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_d9

    .line 249
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4f

    :cond_d9
    const/16 v4, 0x4b

    .line 251
    :goto_4f
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_c5

    .line 252
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_45

    :cond_da
    const-string v3, "CZ"

    .line 288
    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v7, v10, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_dc

    add-int/lit8 v3, v7, -0x2

    const-string v4, "WICZ"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x4

    .line 289
    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_dc

    .line 291
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_db

    .line 292
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 294
    :cond_db
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_c5

    .line 295
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_45

    :cond_dc
    add-int/lit8 v3, v7, 0x1

    const-string v4, "CIA"

    .line 300
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x3

    invoke-static {v1, v3, v9, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_df

    .line 302
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_dd

    .line 303
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_50

    :cond_dd
    const/16 v4, 0x58

    .line 305
    :goto_50
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v9, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v9, :cond_de

    .line 306
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_de
    add-int/lit8 v7, v7, 0x3

    goto/16 :goto_46

    :cond_df
    const-string v4, "CC"

    .line 311
    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v7, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_eb

    if-ne v7, v6, :cond_e0

    const/4 v4, 0x0

    .line 312
    invoke-virtual {v0, v1, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v9

    const/16 v4, 0x4d

    if-eq v9, v4, :cond_eb

    :cond_e0
    add-int/lit8 v3, v7, 0x2

    const-string v4, "I"

    const-string v9, "H"

    .line 315
    filled-new-array {v4, v13, v9}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e8

    const-string v4, "HU"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    .line 316
    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_e8

    if-ne v7, v6, :cond_e1

    add-int/lit8 v3, v7, -0x1

    .line 318
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v3

    const/16 v4, 0x41

    if-eq v3, v4, :cond_e2

    :cond_e1
    add-int/lit8 v3, v7, -0x1

    const/4 v4, 0x5

    const-string v9, "UCCEE"

    const-string v11, "UCCES"

    filled-new-array {v9, v11}, [Ljava/lang/String;

    move-result-object v9

    .line 319
    invoke-static {v1, v3, v4, v9}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_e5

    .line 321
    :cond_e2
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_e3

    .line 323
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_51

    .line 326
    :cond_e3
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v14, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    :goto_51
    iget v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    sub-int/2addr v3, v4

    if-gt v10, v3, :cond_e4

    .line 330
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    goto :goto_53

    .line 333
    :cond_e4
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/4 v9, 0x0

    invoke-virtual {v14, v9, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_53

    :cond_e5
    const/4 v9, 0x0

    .line 338
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_e6

    .line 339
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_52

    :cond_e6
    const/16 v4, 0x58

    .line 341
    :goto_52
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v10, :cond_e7

    .line 342
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_e7
    :goto_53
    add-int/lit8 v3, v7, 0x3

    goto :goto_55

    :cond_e8
    const/4 v9, 0x0

    .line 348
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v7, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v7, :cond_e9

    .line 349
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v7, 0x4b

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_54

    :cond_e9
    const/16 v7, 0x4b

    .line 351
    :goto_54
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v10, :cond_ea

    .line 352
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_ea
    :goto_55
    move v7, v3

    goto/16 :goto_47

    :cond_eb
    const/4 v9, 0x0

    const-string v4, "CK"

    const-string v12, "CG"

    const-string v13, "CQ"

    .line 359
    filled-new-array {v4, v12, v13}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v7, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ee

    .line 360
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ec

    .line 361
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4b

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_56

    :cond_ec
    const/16 v4, 0x4b

    .line 363
    :goto_56
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v10, :cond_ed

    .line 364
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_ed
    :goto_57
    add-int/lit8 v7, v7, 0x2

    goto/16 :goto_47

    :cond_ee
    const-string v4, "CI"

    const-string v12, "CE"

    const-string v13, "CY"

    .line 369
    filled-new-array {v4, v12, v13}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v7, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f2

    const-string v3, "CIO"

    const-string v4, "CIE"

    const-string v10, "CIA"

    .line 371
    filled-new-array {v3, v4, v10}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-static {v1, v7, v4, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f0

    .line 372
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ef

    .line 373
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 375
    :cond_ef
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ed

    .line 376
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x58

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_57

    .line 380
    :cond_f0
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f1

    .line 381
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 383
    :cond_f1
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_ed

    .line 384
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_57

    .line 391
    :cond_f2
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v11, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v11, :cond_f3

    .line 392
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v12, 0x4b

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_58

    :cond_f3
    const/16 v12, 0x4b

    .line 394
    :goto_58
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    iget v11, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v4, v11, :cond_f4

    .line 395
    iget-object v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_f4
    const-string v4, " C"

    const-string v11, " Q"

    const-string v13, " G"

    .line 397
    filled-new-array {v4, v11, v13}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f5

    add-int/lit8 v3, v7, 0x3

    goto/16 :goto_1d

    :cond_f5
    const-string v4, "C"

    const-string v11, "K"

    const-string v13, "Q"

    .line 401
    filled-new-array {v4, v11, v13}, [Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v3, v6, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_42

    const-string v4, "CE"

    const-string v11, "CI"

    filled-new-array {v4, v11}, [Ljava/lang/String;

    move-result-object v4

    .line 402
    invoke-static {v1, v3, v10, v4}, Lcom/helpshift/support/external/DoubleMetaphone;->contains(Ljava/lang/String;II[Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_42

    add-int/lit8 v3, v7, 0x2

    goto/16 :goto_1d

    :pswitch_13
    const/4 v5, -0x1

    const/4 v9, 0x0

    const/16 v12, 0x4b

    .line 145
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f6

    .line 146
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x50

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    :cond_f6
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f7

    .line 149
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    const/16 v4, 0x50

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_f7
    add-int/lit8 v3, v7, 0x1

    .line 151
    invoke-virtual {v0, v1, v3}, Lcom/helpshift/support/external/DoubleMetaphone;->charAt(Ljava/lang/String;I)C

    move-result v4

    const/16 v10, 0x42

    if-ne v4, v10, :cond_42

    goto/16 :goto_1b

    :pswitch_14
    const/4 v5, -0x1

    const/4 v9, 0x0

    const/16 v12, 0x4b

    if-nez v7, :cond_f9

    .line 135
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f8

    .line 136
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x41

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_59

    :cond_f8
    const/16 v4, 0x41

    .line 138
    :goto_59
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v10, :cond_f9

    .line 139
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_f9
    :goto_5a
    add-int/lit8 v7, v7, 0x1

    :cond_fa
    :goto_5b
    const/4 v3, -0x1

    const/16 v4, 0x4b

    const/4 v5, 0x0

    goto/16 :goto_4

    :cond_fb
    const/4 v5, -0x1

    const/4 v9, 0x0

    const/16 v12, 0x4b

    .line 851
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_fc

    .line 852
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    const/16 v4, 0x4e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5c

    :cond_fc
    const/16 v4, 0x4e

    .line 854
    :goto_5c
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v10, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v10, :cond_f9

    .line 855
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5a

    :cond_fd
    const/4 v5, -0x1

    const/4 v9, 0x0

    const/16 v12, 0x4b

    .line 155
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_fe

    .line 156
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 158
    :cond_fe
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    iget v4, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->maxLength:I

    if-ge v3, v4, :cond_f9

    .line 159
    iget-object v3, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5a

    :cond_ff
    if-eqz p2, :cond_100

    .line 1301
    iget-object v1, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->alternate:Ljava/lang/StringBuilder;

    goto :goto_5d

    :cond_100
    iget-object v1, v8, Lcom/helpshift/support/external/DoubleMetaphone$DoubleMetaphoneResult;->primary:Ljava/lang/StringBuilder;

    :goto_5d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x41
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_14
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_14
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_14
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_14
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_14
        :pswitch_0
    .end packed-switch
.end method

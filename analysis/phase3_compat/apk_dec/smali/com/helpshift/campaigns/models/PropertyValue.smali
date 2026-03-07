.class public Lcom/helpshift/campaigns/models/PropertyValue;
.super Ljava/lang/Object;
.source "PropertyValue.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/models/PropertyValue$ValueTypes;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2L


# instance fields
.field private isSynced:Ljava/lang/Integer;

.field private type:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    const-string/jumbo v0, "u"

    .line 28
    iput-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 29
    sget-object v1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iput-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    .line 31
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 32
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 33
    move-object v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v1, "s"

    .line 34
    iput-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    goto :goto_0

    .line 38
    :cond_0
    instance-of v1, p1, Ljava/lang/Long;

    if-eqz v1, :cond_1

    const-string p1, "n"

    .line 39
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 41
    :cond_1
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_2

    const-string p1, "b"

    .line 42
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 44
    :cond_2
    instance-of v1, p1, Ljava/util/Date;

    if-eqz v1, :cond_3

    const-string p1, "d"

    .line 45
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 47
    :cond_3
    instance-of v1, p1, Landroid/location/Location;

    if-eqz v1, :cond_4

    const-string v1, "l"

    .line 48
    iput-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 49
    check-cast p1, Landroid/location/Location;

    invoke-static {p1}, Lcom/helpshift/util/LocationUtil;->sanitizeLocation(Landroid/location/Location;)Landroid/location/Location;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 52
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    .line 53
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    :cond_5
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 66
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/campaigns/models/PropertyValue;->fromString(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 68
    :cond_0
    iget-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    if-nez p1, :cond_1

    const-string/jumbo p1, "u"

    .line 69
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 71
    :cond_1
    sget-object p1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    return-void
.end method

.method private fromString(Ljava/lang/String;)Ljava/lang/Object;
    .locals 5

    .line 128
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x4

    goto :goto_0

    :sswitch_1
    const-string v1, "n"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x3

    goto :goto_0

    :sswitch_2
    const-string v1, "l"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    const/4 v4, 0x2

    goto :goto_0

    :sswitch_3
    const-string v1, "d"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_0

    :cond_3
    const/4 v4, 0x1

    goto :goto_0

    :sswitch_4
    const-string v1, "b"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_0

    :cond_4
    const/4 v4, 0x0

    :goto_0
    const/4 v0, 0x0

    packed-switch v4, :pswitch_data_0

    :catch_0
    :cond_5
    move-object p1, v0

    goto :goto_1

    .line 130
    :pswitch_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    goto :goto_1

    .line 139
    :pswitch_1
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :pswitch_2
    :try_start_1
    const-string v1, ","

    .line 158
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 159
    new-instance v1, Landroid/location/Location;

    const-string v4, ""

    invoke-direct {v1, v4}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 160
    aget-object v3, p1, v3

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-virtual {v1, v3, v4}, Landroid/location/Location;->setLatitude(D)V

    .line 161
    aget-object p1, p1, v2

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    .line 162
    invoke-static {v1}, Lcom/helpshift/util/LocationUtil;->sanitizeLocation(Landroid/location/Location;)Landroid/location/Location;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 147
    :pswitch_3
    :try_start_2
    new-instance v1, Ljava/util/Date;

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    move-object p1, v1

    goto :goto_1

    .line 154
    :pswitch_4
    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    :goto_1
    return-object p1

    :sswitch_data_0
    .sparse-switch
        0x62 -> :sswitch_4
        0x64 -> :sswitch_3
        0x6c -> :sswitch_2
        0x6e -> :sswitch_1
        0x73 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 282
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 283
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 284
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    .line 285
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 268
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 269
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 270
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 100
    instance-of v0, p1, Lcom/helpshift/campaigns/models/PropertyValue;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 101
    check-cast p1, Lcom/helpshift/campaigns/models/PropertyValue;

    .line 102
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 103
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public getIsSynced()Ljava/lang/Integer;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public getValueInfo()Ljava/util/ArrayList;
    .locals 6

    .line 179
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 180
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 181
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v2, "l"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 182
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    check-cast v1, Landroid/location/Location;

    .line 183
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/location/Location;->getLatitude()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/location/Location;->getLongitude()D

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 185
    :cond_0
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v3, "d"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 186
    sget-object v1, Lcom/helpshift/util/HSFormat;->datePropertyTsFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    check-cast v3, Ljava/util/Date;

    invoke-virtual {v1, v3}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_0

    .line 189
    :cond_1
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :goto_0
    return-object v0
.end method

.method public setIsSynced(Ljava/lang/Integer;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 90
    sget-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->valueSet:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    :cond_0
    return-void
.end method

.method public setValue(Lcom/helpshift/campaigns/models/PropertyValue;)Z
    .locals 0

    .line 256
    iget-object p1, p1, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/models/PropertyValue;->setValue(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public setValue(Ljava/lang/Object;)Z
    .locals 5

    .line 201
    instance-of v0, p1, Ljava/lang/String;

    const/4 v1, 0x1

    const-string/jumbo v2, "u"

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v4, "s"

    .line 202
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 203
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 204
    :cond_0
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 205
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 206
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 208
    iput-object v4, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto/16 :goto_0

    :cond_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 211
    :cond_2
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v4, "n"

    .line 212
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 213
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 214
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 216
    iput-object v4, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 218
    :cond_4
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v4, "b"

    .line 219
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 220
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 221
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 223
    iput-object v4, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 225
    :cond_6
    instance-of v0, p1, Ljava/util/Date;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v4, "d"

    .line 226
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 227
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_7
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 228
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 230
    iput-object v4, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    goto :goto_0

    .line 232
    :cond_8
    instance-of v0, p1, Landroid/location/Location;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v4, "l"

    .line 233
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 234
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_9
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/location/Location;

    move-object v2, p1

    check-cast v2, Landroid/location/Location;

    .line 235
    invoke-static {v0, v2}, Lcom/helpshift/util/LocationUtil;->isSameLocation(Landroid/location/Location;Landroid/location/Location;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 238
    iput-object v4, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    .line 239
    invoke-static {v2}, Lcom/helpshift/util/LocationUtil;->sanitizeLocation(Landroid/location/Location;)Landroid/location/Location;

    move-result-object p1

    :goto_0
    if-eqz v1, :cond_a

    .line 243
    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    .line 244
    sget-object p1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iput-object p1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->isSynced:Ljava/lang/Integer;

    :cond_a
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 112
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    if-eqz v0, :cond_1

    .line 113
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v2, "d"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    check-cast v1, Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 117
    :cond_0
    iget-object v1, p0, Lcom/helpshift/campaigns/models/PropertyValue;->type:Ljava/lang/String;

    const-string v2, "l"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 118
    iget-object v0, p0, Lcom/helpshift/campaigns/models/PropertyValue;->value:Ljava/lang/Object;

    check-cast v0, Landroid/location/Location;

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :cond_2
    :goto_0
    return-object v0
.end method

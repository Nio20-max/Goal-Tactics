.class public Lcom/helpshift/campaigns/models/PropertyValue$ValueTypes;
.super Ljava/lang/Object;
.source "PropertyValue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/models/PropertyValue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ValueTypes"
.end annotation


# static fields
.field public static final BOOLEAN:Ljava/lang/String; = "b"

.field public static final DATE:Ljava/lang/String; = "d"

.field public static final LOCATION:Ljava/lang/String; = "l"

.field public static final NUMBER:Ljava/lang/String; = "n"

.field public static final STRING:Ljava/lang/String; = "s"

.field public static final UNKNOWN:Ljava/lang/String; = "u"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 291
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.class public interface abstract Lcom/helpshift/analytics/AnalyticsEventDAO;
.super Ljava/lang/Object;
.source "AnalyticsEventDAO.java"


# virtual methods
.method public abstract getUnsentAnalytics()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getUnsentAnalyticsAppLaunchData()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/analytics/dto/AnalyticsEventDTO;",
            ">;"
        }
    .end annotation
.end method

.method public abstract removeAnalyticsAppLaunchData()V
.end method

.method public abstract removeAnalyticsData(Ljava/lang/String;)V
.end method

.method public abstract saveUnsentAnalyticsAppLaunchData(Lcom/helpshift/analytics/dto/AnalyticsEventDTO;)V
.end method

.method public abstract saveUnsentAnalyticsData(Ljava/lang/String;Ljava/util/HashMap;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

package com.facebook.appevents;

import com.facebook.appevents.AppEventsManager;
import com.facebook.appevents.aam.MetadataIndexer;
import com.facebook.appevents.cloudbridge.AppEventsCAPIManager;
import com.facebook.appevents.eventdeactivation.EventDeactivationManager;
import com.facebook.appevents.iap.InAppPurchaseManager;
import com.facebook.appevents.ml.ModelManager;
import com.facebook.appevents.restrictivedatafilter.RestrictiveDataManager;
import com.facebook.internal.FeatureManager;
import com.facebook.internal.FetchedAppSettings;
import com.facebook.internal.FetchedAppSettingsManager;
import com.facebook.internal.instrument.crashshield.CrashShieldHandler;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

/* JADX INFO: compiled from: AppEventsManager.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\u0003\u001a\u00020\u0004H\u0007¨\u0006\u0005"}, d2 = {"Lcom/facebook/appevents/AppEventsManager;", "", "()V", "start", "", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
public final class AppEventsManager {
    public static final AppEventsManager INSTANCE = new AppEventsManager();

    private AppEventsManager() {
    }

    /* JADX INFO: renamed from: com.facebook.appevents.AppEventsManager$start$1, reason: invalid class name */
    /* JADX INFO: compiled from: AppEventsManager.kt */
    @Metadata(d1 = {"\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\b\n\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H\u0016J\u0012\u0010\u0004\u001a\u00020\u00032\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016¨\u0006\u0007"}, d2 = {"com/facebook/appevents/AppEventsManager$start$1", "Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;", "onError", "", "onSuccess", "fetchedAppSettings", "Lcom/facebook/internal/FetchedAppSettings;", "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public static final class AnonymousClass1 implements FetchedAppSettingsManager.FetchedAppSettingsCallback {
        @Override // com.facebook.internal.FetchedAppSettingsManager.FetchedAppSettingsCallback
        public void onError() {
        }

        AnonymousClass1() {
        }

        @Override // com.facebook.internal.FetchedAppSettingsManager.FetchedAppSettingsCallback
        public void onSuccess(FetchedAppSettings fetchedAppSettings) {
            FeatureManager featureManager = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.AAM, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$bBqBHqH-fqTMXrOoK0rfAppBNr0
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m58onSuccess$lambda0(z);
                }
            });
            FeatureManager featureManager2 = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.RestrictiveDataFiltering, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$uY7ZPpB095dtY1ZTaQdCW92PH8A
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m59onSuccess$lambda1(z);
                }
            });
            FeatureManager featureManager3 = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.PrivacyProtection, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$3bAflEfqYvEc1hw4xONKkb9irAQ
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m60onSuccess$lambda2(z);
                }
            });
            FeatureManager featureManager4 = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.EventDeactivation, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$eYXhpA0Sdk3w4BHWNdAQ9ztgogM
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m61onSuccess$lambda3(z);
                }
            });
            FeatureManager featureManager5 = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.IapLogging, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$cVEVqh1KFQKYzrGVYvm7TnZsISc
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m62onSuccess$lambda4(z);
                }
            });
            FeatureManager featureManager6 = FeatureManager.INSTANCE;
            FeatureManager.checkFeature(FeatureManager.Feature.CloudBridge, new FeatureManager.Callback() { // from class: com.facebook.appevents.-$$Lambda$AppEventsManager$start$1$AOOiUL0kZUoyZbOoeoLJX18sRQc
                @Override // com.facebook.internal.FeatureManager.Callback
                public final void onCompleted(boolean z) {
                    AppEventsManager.AnonymousClass1.m63onSuccess$lambda5(z);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-0, reason: not valid java name */
        public static final void m58onSuccess$lambda0(boolean z) {
            if (z) {
                MetadataIndexer metadataIndexer = MetadataIndexer.INSTANCE;
                MetadataIndexer.enable();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-1, reason: not valid java name */
        public static final void m59onSuccess$lambda1(boolean z) {
            if (z) {
                RestrictiveDataManager restrictiveDataManager = RestrictiveDataManager.INSTANCE;
                RestrictiveDataManager.enable();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-2, reason: not valid java name */
        public static final void m60onSuccess$lambda2(boolean z) {
            if (z) {
                ModelManager modelManager = ModelManager.INSTANCE;
                ModelManager.enable();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-3, reason: not valid java name */
        public static final void m61onSuccess$lambda3(boolean z) {
            if (z) {
                EventDeactivationManager eventDeactivationManager = EventDeactivationManager.INSTANCE;
                EventDeactivationManager.enable();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-4, reason: not valid java name */
        public static final void m62onSuccess$lambda4(boolean z) {
            if (z) {
                InAppPurchaseManager inAppPurchaseManager = InAppPurchaseManager.INSTANCE;
                InAppPurchaseManager.enableAutoLogging();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* JADX INFO: renamed from: onSuccess$lambda-5, reason: not valid java name */
        public static final void m63onSuccess$lambda5(boolean z) {
            if (z) {
                AppEventsCAPIManager appEventsCAPIManager = AppEventsCAPIManager.INSTANCE;
                AppEventsCAPIManager.enable();
            }
        }
    }

    @JvmStatic
    public static final void start() {
        if (CrashShieldHandler.isObjectCrashing(AppEventsManager.class)) {
            return;
        }
        try {
            FetchedAppSettingsManager fetchedAppSettingsManager = FetchedAppSettingsManager.INSTANCE;
            FetchedAppSettingsManager.getAppSettingsAsync(new AnonymousClass1());
        } catch (Throwable th) {
            CrashShieldHandler.handleThrowable(th, AppEventsManager.class);
        }
    }
}

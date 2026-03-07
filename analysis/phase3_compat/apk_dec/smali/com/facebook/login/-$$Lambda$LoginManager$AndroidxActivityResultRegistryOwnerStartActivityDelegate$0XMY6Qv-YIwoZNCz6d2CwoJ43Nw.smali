.class public final synthetic Lcom/facebook/login/-$$Lambda$LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroidx/activity/result/ActivityResultCallback;


# instance fields
.field public final synthetic f$0:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;

.field public final synthetic f$1:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$startActivityForResult$LauncherHolder;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$startActivityForResult$LauncherHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/login/-$$Lambda$LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw;->f$0:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;

    iput-object p2, p0, Lcom/facebook/login/-$$Lambda$LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw;->f$1:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$startActivityForResult$LauncherHolder;

    return-void
.end method


# virtual methods
.method public final onActivityResult(Ljava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/facebook/login/-$$Lambda$LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw;->f$0:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;

    iget-object v1, p0, Lcom/facebook/login/-$$Lambda$LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw;->f$1:Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$startActivityForResult$LauncherHolder;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p1}, Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;->lambda$0XMY6Qv-YIwoZNCz6d2CwoJ43Nw(Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate;Lcom/facebook/login/LoginManager$AndroidxActivityResultRegistryOwnerStartActivityDelegate$startActivityForResult$LauncherHolder;Landroid/util/Pair;)V

    return-void
.end method

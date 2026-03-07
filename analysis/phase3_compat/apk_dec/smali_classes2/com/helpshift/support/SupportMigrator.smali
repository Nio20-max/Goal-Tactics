.class public Lcom/helpshift/support/SupportMigrator;
.super Ljava/lang/Object;
.source "SupportMigrator.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "Helpshift_SupportMigr"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static deleteDBLockFilesOnSDKMigration(Landroid/content/Context;)V
    .locals 2

    .line 251
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 252
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "__hs_supportkvdb_lock"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 253
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 254
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 257
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "__hs_kvdb_lock"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 258
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 260
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 264
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".backups/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/helpshift/databases/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 267
    invoke-static {p0}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 268
    invoke-virtual {p0}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 269
    new-instance v0, Ljava/io/File;

    const-string v1, "__hs__db_profiles"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 270
    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 271
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 274
    :cond_2
    new-instance v0, Ljava/io/File;

    const-string v1, "__hs__kv_backup"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 275
    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 276
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 281
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error on deleting lock file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "Helpshift_SupportMigr"

    invoke-static {v0, p0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private static fixDuplicateConversations(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/util/VersionName;)V
    .locals 8

    .line 187
    new-instance v0, Lcom/helpshift/util/VersionName;

    const-string v1, "7.0.0"

    invoke-direct {v0, v1}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/helpshift/util/VersionName;->isGreaterThanOrEqualTo(Lcom/helpshift/util/VersionName;)Z

    move-result p2

    if-eqz p2, :cond_9

    .line 190
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getAllUsers()Ljava/util/List;

    move-result-object p2

    .line 191
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p0

    .line 194
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 195
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 197
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/account/domainmodel/UserDM;

    .line 199
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getConversationInboxManagerDM()Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->getConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v3

    .line 200
    invoke-virtual {v3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getActiveConversationFromStorage()Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v3

    if-nez v3, :cond_1

    goto :goto_0

    .line 208
    :cond_1
    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {p0, v2, v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v2

    .line 209
    invoke-virtual {v2}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 211
    invoke-static {v2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_0

    .line 215
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 217
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez v4, :cond_4

    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 219
    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    .line 221
    :goto_2
    iget-object v7, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v7}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    iget-object v7, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 222
    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    goto :goto_3

    :cond_5
    const/4 v5, 0x0

    :goto_3
    if-nez v4, :cond_8

    if-eqz v5, :cond_6

    goto :goto_4

    .line 234
    :cond_6
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_7

    .line 236
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 239
    :cond_7
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 241
    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 229
    :cond_8
    :goto_4
    invoke-interface {p0}, Lcom/helpshift/conversation/dao/ConversationDAO;->dropAndCreateDatabase()V

    .line 230
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p0

    invoke-interface {p0}, Lcom/helpshift/CoreApi;->resetUsersSyncStatusAndStartSetupForActiveUser()V

    :cond_9
    return-void
.end method

.method public static migrate(Landroid/content/Context;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/support/HSApiData;Lcom/helpshift/support/HSStorage;)V
    .locals 16

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v11, p4

    .line 41
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->getLibraryVersion()Ljava/lang/String;

    move-result-object v12

    .line 42
    invoke-static {v12}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    const-string v13, "7.11.1"

    if-nez v2, :cond_2

    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 43
    invoke-static {v12}, Lcom/helpshift/support/SupportMigrator;->parseSDKVersion(Ljava/lang/String;)Lcom/helpshift/util/VersionName;

    move-result-object v14

    .line 44
    new-instance v2, Lcom/helpshift/util/VersionName;

    invoke-direct {v2, v13}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v14, v2}, Lcom/helpshift/util/VersionName;->isLessThan(Lcom/helpshift/util/VersionName;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 50
    new-instance v2, Lcom/helpshift/util/VersionName;

    const-string v3, "7.0.0"

    invoke-direct {v2, v3}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14, v2}, Lcom/helpshift/util/VersionName;->isLessThan(Lcom/helpshift/util/VersionName;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 51
    new-instance v15, Lcom/helpshift/support/storage/LegacyUserDataMigrator;

    .line 52
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v3

    .line 54
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v5

    .line 55
    invoke-static/range {p0 .. p0}, Lcom/helpshift/account/dao/legacy/AndroidLegacyProfileDAO;->getInstance(Landroid/content/Context;)Lcom/helpshift/account/dao/legacy/AndroidLegacyProfileDAO;

    move-result-object v6

    .line 56
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getBackupDAO()Lcom/helpshift/common/dao/BackupDAO;

    move-result-object v7

    .line 57
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getLegacyUserMigrationDataSource()Lcom/helpshift/migration/LegacyProfileMigrationDAO;

    move-result-object v8

    .line 58
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getLegacyAnalyticsEventIDDAO()Lcom/helpshift/migration/LegacyAnalyticsEventIDDAO;

    move-result-object v9

    move-object v2, v15

    move-object/from16 v4, p4

    move-object v10, v14

    invoke-direct/range {v2 .. v10}, Lcom/helpshift/support/storage/LegacyUserDataMigrator;-><init>(Lcom/helpshift/CoreApi;Lcom/helpshift/support/HSStorage;Lcom/helpshift/common/platform/KVStore;Lcom/helpshift/migration/legacyUser/LegacyProfileDAO;Lcom/helpshift/common/dao/BackupDAO;Lcom/helpshift/migration/LegacyProfileMigrationDAO;Lcom/helpshift/migration/LegacyAnalyticsEventIDDAO;Lcom/helpshift/util/VersionName;)V

    .line 60
    new-instance v2, Lcom/helpshift/support/storage/SupportKVStoreMigrator;

    invoke-direct {v2, v11}, Lcom/helpshift/support/storage/SupportKVStoreMigrator;-><init>(Lcom/helpshift/support/HSStorage;)V

    .line 63
    invoke-virtual {v15, v14}, Lcom/helpshift/support/storage/LegacyUserDataMigrator;->backup(Lcom/helpshift/util/VersionName;)V

    .line 64
    invoke-virtual {v2, v14}, Lcom/helpshift/support/storage/SupportKVStoreMigrator;->backup(Lcom/helpshift/util/VersionName;)V

    .line 65
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->backupForMigration()V

    .line 68
    invoke-virtual/range {p3 .. p3}, Lcom/helpshift/support/HSApiData;->clearETagsForFaqs()V

    .line 69
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->clearDatabase()V

    .line 70
    invoke-virtual {v15}, Lcom/helpshift/support/storage/LegacyUserDataMigrator;->dropProfileDB()V

    .line 72
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v3

    invoke-interface {v3}, Lcom/helpshift/conversation/dao/ConversationDAO;->dropAndCreateDatabase()V

    .line 76
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v3

    invoke-interface {v3}, Lcom/helpshift/CoreApi;->resetUsersSyncStatusAndStartSetupForActiveUser()V

    .line 78
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v3

    invoke-interface {v3}, Lcom/helpshift/common/platform/KVStore;->removeAllKeys()V

    .line 81
    invoke-virtual {v15}, Lcom/helpshift/support/storage/LegacyUserDataMigrator;->restore()V

    .line 82
    invoke-virtual {v2}, Lcom/helpshift/support/storage/SupportKVStoreMigrator;->restore()V

    .line 83
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->restoreMigrationData()V

    .line 86
    invoke-virtual/range {p2 .. p2}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUserSetupDM()Lcom/helpshift/account/domainmodel/UserSetupDM;

    move-result-object v1

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserSetupDM;->startSetup()V

    .line 89
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->clearLegacySearchIndexFile()V

    .line 90
    invoke-static/range {p0 .. p0}, Lcom/helpshift/support/SupportMigrator;->deleteDBLockFilesOnSDKMigration(Landroid/content/Context;)V

    goto :goto_0

    .line 96
    :cond_0
    invoke-static {v0, v1, v14}, Lcom/helpshift/support/SupportMigrator;->fixDuplicateConversations(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/util/VersionName;)V

    .line 103
    invoke-static {v0, v1, v14}, Lcom/helpshift/support/SupportMigrator;->updateRejectConversations(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/util/VersionName;)V

    .line 110
    :goto_0
    invoke-static {v0, v14}, Lcom/helpshift/support/SupportMigrator;->removeConfigApiEtag(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/util/VersionName;)V

    goto :goto_1

    .line 112
    :cond_1
    invoke-virtual {v14, v2}, Lcom/helpshift/util/VersionName;->isGreaterThan(Lcom/helpshift/util/VersionName;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 114
    new-instance v1, Lcom/helpshift/support/storage/SupportDowngradeMigrator;

    invoke-direct {v1}, Lcom/helpshift/support/storage/SupportDowngradeMigrator;-><init>()V

    .line 116
    invoke-virtual {v1, v14}, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->backup(Lcom/helpshift/util/VersionName;)V

    .line 119
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/common/platform/KVStore;->removeAllKeys()V

    .line 120
    invoke-virtual/range {p3 .. p3}, Lcom/helpshift/support/HSApiData;->clearETagsForFaqs()V

    .line 121
    invoke-virtual/range {p4 .. p4}, Lcom/helpshift/support/HSStorage;->clearDatabase()V

    .line 122
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->dropAndCreateDatabase()V

    .line 123
    invoke-interface/range {p1 .. p1}, Lcom/helpshift/common/platform/Platform;->getUserDAO()Lcom/helpshift/account/dao/UserDAO;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/account/dao/UserDAO;->dropAndCreateDatabase()V

    .line 126
    invoke-virtual {v1}, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->restore()V

    .line 131
    :cond_2
    :goto_1
    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 132
    invoke-virtual {v11, v13}, Lcom/helpshift/support/HSStorage;->setLibraryVersion(Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method private static parseSDKVersion(Ljava/lang/String;)Lcom/helpshift/util/VersionName;
    .locals 3

    .line 286
    new-instance v0, Lcom/helpshift/util/VersionName;

    const-string v1, "0"

    invoke-direct {v0, v1}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    .line 288
    :try_start_0
    new-instance v1, Lcom/helpshift/util/VersionName;

    invoke-direct {v1, p0}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 291
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error in creating SemVer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_SupportMigr"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method

.method private static removeConfigApiEtag(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/util/VersionName;)V
    .locals 2

    .line 138
    new-instance v0, Lcom/helpshift/util/VersionName;

    const-string v1, "7.9.0"

    invoke-direct {v0, v1}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/helpshift/util/VersionName;->isLessThan(Lcom/helpshift/util/VersionName;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 139
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object p0

    sget-object p1, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    invoke-interface {p0, p1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->removeETag(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static updateRejectConversations(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/util/VersionName;)V
    .locals 5

    .line 152
    new-instance v0, Lcom/helpshift/util/VersionName;

    const-string v1, "7.0.0"

    invoke-direct {v0, v1}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Lcom/helpshift/util/VersionName;->isGreaterThanOrEqualTo(Lcom/helpshift/util/VersionName;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/helpshift/util/VersionName;

    const-string v1, "7.1.0"

    invoke-direct {v0, v1}, Lcom/helpshift/util/VersionName;-><init>(Ljava/lang/String;)V

    .line 153
    invoke-virtual {p2, v0}, Lcom/helpshift/util/VersionName;->isLessThanOrEqualTo(Lcom/helpshift/util/VersionName;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 154
    invoke-interface {p0}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p0

    .line 155
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getAllUsers()Ljava/util/List;

    move-result-object p2

    .line 157
    invoke-static {p2}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 160
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/account/domainmodel/UserDM;

    .line 162
    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {p0, v1, v2}, Lcom/helpshift/conversation/dao/ConversationDAO;->readConversationsWithoutMessages(J)Lcom/helpshift/common/dao/DAOResult;

    move-result-object v1

    .line 163
    invoke-virtual {v1}, Lcom/helpshift/common/dao/DAOResult;->getData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 166
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 169
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    .line 171
    iget-object v3, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v4, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v3, v4, :cond_3

    iget-boolean v3, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isStartNewConversationClicked:Z

    if-nez v3, :cond_3

    .line 174
    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    iput-wide v3, v2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->userLocalId:J

    .line 175
    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getConversationInboxManagerDM()Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    move-result-object v3

    .line 176
    invoke-virtual {v3, v0}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;->getConversationInboxDM(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/domainmodel/ConversationController;

    move-result-object v3

    iget-object v3, v3, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    const/4 v4, 0x1

    .line 177
    invoke-virtual {v3, v2, v4, v4}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->setStartNewConversationButtonClicked(Lcom/helpshift/conversation/activeconversation/model/Conversation;ZZ)V

    goto :goto_1

    :cond_4
    return-void
.end method

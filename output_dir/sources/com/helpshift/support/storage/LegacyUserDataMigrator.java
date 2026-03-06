package com.helpshift.support.storage;

import android.provider.Settings;
import com.helpshift.CoreApi;
import com.helpshift.HelpshiftUser;
import com.helpshift.account.dao.ProfileDTO;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.KVStore;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.migration.LegacyAnalyticsEventIDDAO;
import com.helpshift.migration.LegacyProfileMigrationDAO;
import com.helpshift.migration.MigrationState;
import com.helpshift.migration.legacyUser.LegacyProfile;
import com.helpshift.migration.legacyUser.LegacyProfileDAO;
import com.helpshift.support.HSStorage;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import com.helpshift.util.VersionName;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class LegacyUserDataMigrator implements SDKMigrator {
    private static final String DEFAULT_USER_LOGIN_KEY = "default_user_login";
    private static final String DEFAULT_USER_PROFILE = "default_user_profile";
    private static final String KEY_DEVICE_ID = "key_support_device_id";
    private static final String LOGIN_IDENTIFIER = "loginIdentifier";
    private BackupDAO backupDAO;
    private CoreApi coreApi;
    private String defaultIdentifier;
    private ProfileDTO defaultProfileDto;
    private Domain domain;
    private VersionName fromVersion;
    private HSStorage hsStorage;
    private KVStore kvStore;
    private LegacyAnalyticsEventIDDAO legacyAnalyticsEventIDDAO;
    private LegacyProfileDAO legacyProfileDAO;
    private LegacyProfileMigrationDAO legacyProfileMigrationDAO;
    private String loginIdentifier;
    private List<ProfileDTO> loginProfileDtos;

    public LegacyUserDataMigrator(CoreApi coreApi, HSStorage hSStorage, KVStore kVStore, LegacyProfileDAO legacyProfileDAO, BackupDAO backupDAO, LegacyProfileMigrationDAO legacyProfileMigrationDAO, LegacyAnalyticsEventIDDAO legacyAnalyticsEventIDDAO, VersionName versionName) {
        this.coreApi = coreApi;
        this.domain = coreApi.getDomain();
        this.hsStorage = hSStorage;
        this.kvStore = kVStore;
        this.legacyProfileDAO = legacyProfileDAO;
        this.backupDAO = backupDAO;
        this.legacyProfileMigrationDAO = legacyProfileMigrationDAO;
        this.legacyAnalyticsEventIDDAO = legacyAnalyticsEventIDDAO;
        this.fromVersion = versionName;
    }

    @Override // com.helpshift.support.storage.SDKMigrator
    public void backup(VersionName versionName) {
        if (versionName.isGreaterThanOrEqualTo(new VersionName("7.0.0"))) {
            return;
        }
        if (versionName.isLessThanOrEqualTo(new VersionName("4.9.1"))) {
            this.loginIdentifier = this.hsStorage.getString(LOGIN_IDENTIFIER);
            String string = this.hsStorage.getString("identity");
            String string2 = this.hsStorage.getString(ConversationTable.Columns.LOCAL_UUID);
            this.defaultIdentifier = string2;
            if (StringUtils.isEmpty(string2)) {
                this.defaultIdentifier = Settings.Secure.getString(HelpshiftContext.getApplicationContext().getContentResolver(), "android_id");
            }
            this.defaultProfileDto = new ProfileDTO(null, this.defaultIdentifier, string, this.hsStorage.getString("username"), this.hsStorage.getString("email"), null, null, null, true);
            List<ProfileDTO> listFetchProfiles = this.legacyProfileDAO.fetchProfiles();
            if (ListUtils.isEmpty(listFetchProfiles)) {
                return;
            }
            this.loginProfileDtos = new ArrayList();
            for (ProfileDTO profileDTO : listFetchProfiles) {
                this.loginProfileDtos.add(new ProfileDTO(profileDTO.localId, profileDTO.identifier, profileDTO.serverId, profileDTO.name, profileDTO.email, profileDTO.identifier + "_" + profileDTO.saltedIdentifier, profileDTO.uid, profileDTO.did, profileDTO.isPushTokenSynced));
            }
            return;
        }
        this.loginIdentifier = this.kvStore.getString(LOGIN_IDENTIFIER);
        String string3 = this.kvStore.getString(DEFAULT_USER_LOGIN_KEY);
        this.defaultIdentifier = string3;
        if (!StringUtils.isEmpty(string3)) {
            Object serializable = this.kvStore.getSerializable(DEFAULT_USER_PROFILE);
            if (serializable instanceof ProfileDTO) {
                this.defaultProfileDto = (ProfileDTO) serializable;
            }
        }
        this.loginProfileDtos = this.legacyProfileDAO.fetchProfiles();
    }

    @Override // com.helpshift.support.storage.SDKMigrator
    public void restore() {
        if (this.fromVersion.isGreaterThanOrEqualTo(new VersionName("7.0.0"))) {
            return;
        }
        String str = this.defaultIdentifier;
        if (str != null) {
            this.kvStore.setString("key_support_device_id", str);
            this.backupDAO.storeValue("key_support_device_id", this.defaultIdentifier);
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ProfileDTO profileDTO = this.defaultProfileDto;
        if (profileDTO != null && !StringUtils.isEmpty(profileDTO.serverId)) {
            UserDM anonymousUser = this.domain.getUserManagerDM().getAnonymousUser();
            if (anonymousUser == null) {
                anonymousUser = this.domain.getUserManagerDM().createAnonymousUser();
            }
            arrayList2.add(new LegacyProfile(anonymousUser.getIdentifier(), this.defaultProfileDto.email, this.defaultProfileDto.name, this.defaultProfileDto.serverId, MigrationState.NOT_STARTED));
        }
        if (!ListUtils.isEmpty(this.loginProfileDtos)) {
            for (ProfileDTO profileDTO2 : this.loginProfileDtos) {
                if (!StringUtils.isEmpty(profileDTO2.serverId)) {
                    arrayList2.add(new LegacyProfile(profileDTO2.identifier, profileDTO2.email, profileDTO2.name, profileDTO2.serverId, MigrationState.NOT_STARTED));
                }
                arrayList.add(new KeyValuePair(profileDTO2.identifier, profileDTO2.saltedIdentifier));
            }
        }
        if (!ListUtils.isEmpty(arrayList2)) {
            this.legacyProfileMigrationDAO.storeLegacyProfiles(arrayList2);
        }
        if (!ListUtils.isEmpty(arrayList)) {
            this.legacyAnalyticsEventIDDAO.storeLegacyAnalyticsEventIDs(arrayList);
        }
        if (StringUtils.isEmpty(this.loginIdentifier)) {
            this.coreApi.logout();
            return;
        }
        List<ProfileDTO> list = this.loginProfileDtos;
        if (list != null) {
            for (ProfileDTO profileDTO3 : list) {
                if (this.loginIdentifier.equals(profileDTO3.identifier)) {
                    this.coreApi.login(new HelpshiftUser.Builder(profileDTO3.identifier, profileDTO3.email).setName(profileDTO3.email).build());
                    return;
                }
            }
        }
    }

    public void dropProfileDB() {
        this.legacyProfileDAO.deleteProfiles();
    }
}

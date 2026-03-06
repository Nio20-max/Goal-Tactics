package com.helpshift.migration;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.domain.network.UserNotFoundNetwork;
import com.helpshift.common.domain.network.UserPreConditionsFailedNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.migration.legacyUser.LegacyProfile;
import com.helpshift.util.StringUtils;
import java.lang.ref.WeakReference;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class RemoteDataMigrator {
    private Domain domain;
    private LegacyProfileMigrationDAO legacyProfileMigrationDAO;
    private Platform platform;
    private WeakReference<RemoteDataMigratorListener> remoteDataMigratorListener;
    private UserDM userDM;

    public interface RemoteDataMigratorListener {
        void onMigrationStateChanged(UserDM userDM, MigrationState migrationState, MigrationState migrationState2);
    }

    public RemoteDataMigrator(Platform platform, Domain domain, UserDM userDM, RemoteDataMigratorListener remoteDataMigratorListener) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
        this.remoteDataMigratorListener = new WeakReference<>(remoteDataMigratorListener);
        this.legacyProfileMigrationDAO = platform.getLegacyUserMigrationDataSource();
    }

    public void setAppropriateInitialState() {
        if (getProfileMigrationState() == MigrationState.IN_PROGRESS) {
            updateProfileMigrationStateUpdate(MigrationState.IN_PROGRESS, MigrationState.NOT_STARTED);
        }
    }

    public MigrationState getProfileMigrationState() {
        if (StringUtils.isEmpty(this.userDM.getIdentifier())) {
            return MigrationState.COMPLETED;
        }
        LegacyProfile legacyProfileFetchLegacyProfile = this.legacyProfileMigrationDAO.fetchLegacyProfile(this.userDM.getIdentifier());
        if (legacyProfileFetchLegacyProfile == null) {
            return MigrationState.COMPLETED;
        }
        return legacyProfileFetchLegacyProfile.migrationState;
    }

    public void startProfileMigration() {
        MigrationState profileMigrationState = getProfileMigrationState();
        if (profileMigrationState == MigrationState.COMPLETED || profileMigrationState == MigrationState.IN_PROGRESS) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.migration.RemoteDataMigrator.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    RemoteDataMigrator.this.runRemoteMigrationInternal();
                } catch (RootAPIException e) {
                    RemoteDataMigrator.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.MIGRATION, e.getServerStatusCode());
                    throw e;
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runRemoteMigrationInternal() {
        LegacyProfile legacyProfileFetchLegacyProfile;
        MigrationState profileMigrationState = getProfileMigrationState();
        if (profileMigrationState == MigrationState.COMPLETED || profileMigrationState == MigrationState.IN_PROGRESS || (legacyProfileFetchLegacyProfile = this.legacyProfileMigrationDAO.fetchLegacyProfile(this.userDM.getIdentifier())) == null) {
            return;
        }
        MigrationState migrationState = legacyProfileFetchLegacyProfile.migrationState;
        if (migrationState == MigrationState.NOT_STARTED || migrationState == MigrationState.FAILED) {
            GuardOKNetwork guardOKNetwork = new GuardOKNetwork(new FailedAPICallNetworkDecorator(new UserNotFoundNetwork(new UserPreConditionsFailedNetwork(new TSCorrectedNetwork(new POSTNetwork("/migrate-profile/", this.domain, this.platform), this.platform)))));
            HashMap map = new HashMap();
            map.put("profile-id", legacyProfileFetchLegacyProfile.serverId);
            map.put(ProfileTable.Columns.COLUMN_DID, this.userDM.getDeviceId());
            if (!StringUtils.isEmpty(this.userDM.getIdentifier())) {
                map.put(ProfileTable.Columns.COLUMN_UID, this.userDM.getIdentifier());
            }
            if (!StringUtils.isEmpty(this.userDM.getEmail())) {
                map.put("email", this.userDM.getEmail());
            }
            updateProfileMigrationStateUpdate(migrationState, MigrationState.IN_PROGRESS);
            try {
                guardOKNetwork.makeRequest(new RequestData(map));
                updateProfileMigrationStateUpdate(migrationState, MigrationState.COMPLETED);
            } catch (RootAPIException e) {
                if (e.exceptionType == NetworkException.USER_PRE_CONDITION_FAILED || e.exceptionType == NetworkException.USER_NOT_FOUND) {
                    updateProfileMigrationStateUpdate(migrationState, MigrationState.COMPLETED);
                } else if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                    updateProfileMigrationStateUpdate(migrationState, MigrationState.COMPLETED);
                } else {
                    updateProfileMigrationStateUpdate(migrationState, MigrationState.FAILED);
                    throw e;
                }
            }
        }
    }

    private void updateProfileMigrationStateUpdate(final MigrationState migrationState, final MigrationState migrationState2) {
        if (migrationState2 == MigrationState.COMPLETED) {
            this.legacyProfileMigrationDAO.deleteLegacyProfile(this.userDM.getIdentifier());
        } else {
            this.legacyProfileMigrationDAO.updateMigrationState(this.userDM.getIdentifier(), migrationState2);
        }
        this.domain.runSerial(new F() { // from class: com.helpshift.migration.RemoteDataMigrator.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (RemoteDataMigrator.this.remoteDataMigratorListener.get() != null) {
                    ((RemoteDataMigratorListener) RemoteDataMigrator.this.remoteDataMigratorListener.get()).onMigrationStateChanged(RemoteDataMigrator.this.userDM, migrationState, migrationState2);
                }
            }
        });
    }

    public void retry() {
        runRemoteMigrationInternal();
    }
}

package com.helpshift.campaigns.activities;

import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.helpshift.R;
import com.helpshift.activities.MainActivity;
import com.helpshift.campaigns.fragments.InboxFragment;

/* JADX INFO: loaded from: classes.dex */
public class ParentActivity extends MainActivity {
    FragmentManager fragmentManager;

    @Override // com.helpshift.activities.MainActivity, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.hs__campaign_parent_activity);
        setSupportActionBar((Toolbar) findViewById(R.id.toolbar));
        ActionBar supportActionBar = getSupportActionBar();
        if (supportActionBar != null) {
            supportActionBar.setDisplayHomeAsUpEnabled(true);
        }
        FragmentManager supportFragmentManager = getSupportFragmentManager();
        this.fragmentManager = supportFragmentManager;
        if (bundle == null) {
            FragmentTransaction fragmentTransactionBeginTransaction = supportFragmentManager.beginTransaction();
            fragmentTransactionBeginTransaction.add(R.id.campaigns_fragment_container, InboxFragment.newInstance(getIntent().getExtras()));
            fragmentTransactionBeginTransaction.commit();
        }
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        if (((InboxFragment) getSupportFragmentManager().findFragmentById(R.id.campaigns_fragment_container)).onBackPressed()) {
            super.onBackPressed();
        }
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            onBackPressed();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // android.app.Activity
    public void onContextMenuClosed(Menu menu) {
        InboxFragment inboxFragment = (InboxFragment) getSupportFragmentManager().findFragmentById(R.id.campaigns_fragment_container);
        if (inboxFragment != null) {
            inboxFragment.onContextMenuClosed(menu);
        }
        super.onContextMenuClosed(menu);
    }
}

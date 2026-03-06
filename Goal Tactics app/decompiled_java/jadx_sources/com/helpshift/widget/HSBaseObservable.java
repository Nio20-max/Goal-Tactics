package com.helpshift.widget;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;

/* JADX INFO: loaded from: classes2.dex */
public abstract class HSBaseObservable {
    private Domain domain;
    private HSObserver viewObserver;

    protected abstract void notifyInitialState();

    public void subscribe(Domain domain, HSObserver hSObserver) {
        this.domain = domain;
        this.viewObserver = hSObserver;
        notifyInitialState();
    }

    public void unsubscribe() {
        this.viewObserver = null;
    }

    public void notifyChange(final Object obj) {
        Domain domain;
        if (this.viewObserver == null || (domain = this.domain) == null) {
            return;
        }
        domain.runOnUI(new F() { // from class: com.helpshift.widget.HSBaseObservable.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (HSBaseObservable.this.viewObserver != null) {
                    HSBaseObservable.this.viewObserver.onChanged(obj);
                }
            }
        });
    }
}
